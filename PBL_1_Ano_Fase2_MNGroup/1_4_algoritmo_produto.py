# Lembrar de criar uma linha de comando que crie o arquivo JSON: Ele deve se chamar: 1_5_arquivo_produto.json

import json

# Lambda para calcular valor do ICMS
calcula_icms = lambda valor: valor * 0.18

# Função que cadastro um produto e retorna um dicionário
def cadastrar_produto():
    descricao = input("Digite a descrição do produto: ")
    while True:
        try:
            valor = float(input("Digite o valor do produto: "))
            break
        except ValueError:
            print("Por favor, insira um valor numérico válido.")
    
    embalagem = input("Digite o tipo de embalagem do produto: ")

    icms = calcula_icms(valor)
    
    return {
        "descricao": descricao,
        "valor": valor,
        "embalagem": embalagem,
        "icms": icms
    }

# Criação de uma lista para guardar os dicionários de produtos
produtos = []

# Loop para garantir que seja inserido no mínimo 5 produtos
while True:
    produtos.append(cadastrar_produto())
    continuar = input("Deseja cadastrar um novo produto? (sim/não): ").lower()
    if continuar != 'sim':
        break

# Validação para criação de arquivo JSON
if len(produtos) < 5:
    print("Você precisa cadastrar no mínimo 5 produtos.")
else:
    with open("1_5_arquivo_produto.json", "w") as file:
        json.dump(produtos, file, indent=4)
    print("Arquivo JSON criado com sucesso!")
