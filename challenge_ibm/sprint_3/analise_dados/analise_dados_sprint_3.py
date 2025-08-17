from pyspark.sql import SparkSession
from pyspark.sql.functions import col, sum, avg, count, first, to_timestamp, datediff
import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np
import builtins  
from scipy.stats import ttest_ind

# Inicializar a sessão Spark
spark = SparkSession.builder \
    .appName("OlistAnalysis") \
    .getOrCreate()

# Carregar os dados
customers = spark.read.csv("olist_customers_dataset.csv", header=True, inferSchema=True)
orders = spark.read.csv("olist_orders_dataset.csv", header=True, inferSchema=True)
order_items = spark.read.csv("olist_order_items_dataset.csv", header=True, inferSchema=True)
order_payments = spark.read.csv("olist_order_payments_dataset.csv", header=True, inferSchema=True)
products = spark.read.csv("olist_products_dataset.csv", header=True, inferSchema=True)

# Merge dos datasets principais
orders_customers = orders.join(customers, "customer_id", "inner")
orders_payments = orders_customers.join(order_payments, "order_id", "inner")
orders_items = orders_payments.join(order_items, "order_id", "inner")
orders_with_categories = orders_items.join(
    products.select("product_id", "product_category_name"), 
    "product_id", 
    "inner"
)

# Conversão de datas e cálculo do tempo de entrega
orders_items = orders_items.withColumn(
    "order_purchase_timestamp", to_timestamp(col("order_purchase_timestamp")))
orders_items = orders_items.withColumn(
    "order_delivered_customer_date", to_timestamp(col("order_delivered_customer_date")))
orders_items = orders_items.withColumn(
    "delivery_time", datediff(col("order_delivered_customer_date"), col("order_purchase_timestamp"))
)

# Agregação por pedido
aggregated = orders_items.groupBy("order_id").agg(
    sum("payment_value").alias("payment_value"),
    first("payment_type").alias("payment_type"),
    sum("price").alias("price"),
    sum("freight_value").alias("freight_value"),
    count("order_item_id").alias("item_count"),
    avg("delivery_time").alias("delivery_time"),
    first("customer_state").alias("customer_state")
)

# Converter para Pandas para visualização
aggregated_pd = aggregated.toPandas()

# Análise 1: Correlação entre tipo de pagamento e valor pago
payment_analysis = aggregated_pd.groupby("payment_type")["payment_value"].mean().sort_values(ascending=False)
plt.figure(figsize=(8, 5))
sns.barplot(x=payment_analysis.index, y=payment_analysis.values)
plt.title("Média de Valor Pago por Tipo de Pagamento")
plt.xlabel("Tipo de Pagamento")
plt.ylabel("Valor Médio Pago (R$)")
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()

# Análise 2: Distribuição de pedidos por estado
state_distribution = aggregated_pd['customer_state'].value_counts().sort_values(ascending=False)
plt.figure(figsize=(10, 5))
sns.barplot(x=state_distribution.index, y=state_distribution.values)
plt.title("Distribuição de Pedidos por Estado")
plt.xlabel("Estado (UF)")
plt.ylabel("Quantidade de Pedidos")
plt.tight_layout()
plt.show()

# Análise 3: Matriz de Correlação
correlation_data = aggregated_pd[['price', 'freight_value', 'item_count', 'delivery_time']]
correlation_matrix = correlation_data.corr()
plt.figure(figsize=(8, 6))
sns.heatmap(correlation_matrix, annot=True, cmap="coolwarm", fmt=".2f")
plt.title("Matriz de Correlação entre Variáveis")
plt.tight_layout()
plt.show()

# Análise 4: Teste de Hipótese
sudeste = ['SP', 'RJ', 'MG', 'ES']
pagamentos_sudeste = aggregated_pd[aggregated_pd['customer_state'].isin(sudeste)]['payment_value']
pagamentos_outras = aggregated_pd[~aggregated_pd['customer_state'].isin(sudeste)]['payment_value']
t_stat, p_value = ttest_ind(pagamentos_sudeste, pagamentos_outras, equal_var=False)

print("Média - Sudeste: R$", builtins.round(pagamentos_sudeste.mean(), 2))
print("Média - Outras Regiões: R$", builtins.round(pagamentos_outras.mean(), 2))
print("Valor-p do teste t:", p_value)

if p_value < 0.05:
    print("\nResultado: Rejeitamos a hipótese. Clientes do Sudeste não gastam mais.")
else:
    print("\nResultado: Não rejeitamos a hipótese. Não há diferença significativa.")

# Análise 5: Quantidade de pedidos por categoria de produto (agregação no Spark)
orders_with_categories = orders_with_categories.withColumn(
    "freight_ratio", col("freight_value") / col("price")
)

freight_by_category_spark = orders_with_categories.groupBy("product_category_name").agg(
    avg("freight_ratio").alias("avg_freight_ratio")
).orderBy(col("avg_freight_ratio").desc())

freight_by_category_pd = freight_by_category_spark.limit(20).toPandas()

# Gráfico
plt.figure(figsize=(12, 8))
sns.barplot(
    x='avg_freight_ratio',
    y='product_category_name',
    data=freight_by_category_pd,
    palette='rocket'
)
plt.title('Top 20 Categorias com Maior Frete em Relação ao Preço do Produto')
plt.xlabel('Média da Proporção Frete/Preço')
plt.ylabel('Categoria de Produto')
plt.tight_layout()
plt.show()

# Análise 6: Impacto do Frete nas Vendas (usando amostra)
sample_orders = orders_with_categories.select("freight_ratio").sample(fraction=0.1, seed=42)
sample_pd = sample_orders.toPandas()

plt.figure(figsize=(10, 6))
sns.histplot(data=sample_pd, x='freight_ratio', bins=50, kde=True)
plt.title('Distribuição da Proporção Frete/Preço do Produto (Amostra)')
plt.xlabel('Proporção Frete/Preço')
plt.ylabel('Contagem de Pedidos')
plt.axvline(x=0.5, color='r', linestyle='--', label='50% do valor do produto')
plt.legend()
plt.tight_layout()
plt.show()

# Análise 7: Correlação entre frete e cancelamentos (se disponível)
if 'order_status' in orders.columns:
    status_freight = orders.select("order_id", "order_status") \
        .join(
            order_items.groupBy("order_id").agg(sum("freight_value").alias("freight_value")),
            "order_id"
        )
    
    status_freight_pd = status_freight.toPandas()
    
    plt.figure(figsize=(10, 6))
    sns.boxplot(data=status_freight_pd, x='order_status', y='freight_value')
    plt.title('Distribuição do Valor do Frete por Status do Pedido')
    plt.xlabel('Status do Pedido')
    plt.ylabel('Valor do Frete (R$)')
    plt.xticks(rotation=45)
    plt.tight_layout()
    plt.show()
else:
    print("\nDataset de orders não contém informação de order_status para análise de cancelamentos.")

# Encerrar a sessão Spark
spark.stop()
