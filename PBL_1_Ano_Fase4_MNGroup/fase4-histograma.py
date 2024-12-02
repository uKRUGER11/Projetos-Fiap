import pandas as pd
import matplotlib.pyplot as plt

# Caminho para o arquivo CSV
arquivo_csv = r'D:\PBLFIAP\Projetos-Fiap\PBL_1_Ano_Fase4_MNGroup\ocorrencias_sac.csv'

# Carregar o arquivo CSV
df = pd.read_csv(arquivo_csv)

# Corrigir os nomes das colunas removendo espaços desnecessários
df.rename(columns=lambda x: x.strip(), inplace=True)

# Coluna de data convertida
coluna_data = 'data_ocorrencia'  # Nome identificado no arquivo anterior
df[coluna_data] = pd.to_datetime(df[coluna_data], format='%Y-%m-%d', errors='coerce')

# Remover registros com datas inválidas
df = df.dropna(subset=[coluna_data])

# Contar a frequência de ocorrências por dia
frequencia_por_dia = df[coluna_data].value_counts().sort_index()

# Gerar o histograma
plt.figure(figsize=(12, 6))
plt.bar(frequencia_por_dia.index, frequencia_por_dia.values, width=0.8)
plt.title('Distribuição de Frequência de Ocorrências por Dia', fontsize=16)
plt.xlabel('Data', fontsize=12)
plt.ylabel('Número de Ocorrências', fontsize=12)
plt.xticks(rotation=45, fontsize=10)
plt.grid(axis='y', linestyle='--', alpha=0.7)

# Salvar o gráfico como imagem
output_image_path = r'D:\Fase2FIAP\Projetos-Fiap\histograma_ocorrencias_sac.png'
plt.tight_layout()
plt.savefig(output_image_path)
plt.show()

# Exibir as estatísticas da frequência para análise adicional
print(frequencia_por_dia.describe())
