# A)
import json

# B)
calcula_icms = lambda valor : valor * 0.18

# D)
class ValorNaoNumericoError(Exception):
    def __init__(self, message="Digite um valor válido\n"):
        super().__init__(message)

# D)
class ValorNegativoError(Exception):
    def __init__(self, message="O valor não pode ser negativo ou zero.\n"):
        super().__init__(message)

# Função que cadastro um produto e retorna um dicionário
def cadastrar_produto():
    while True:
        try:
            descricao = input("Digite a descrição do produto: ")
            if not descricao or descricao.strip().lstrip('-').isdigit():
                raise ValorNaoNumericoError()  

            valor = float(input("Digite o valor do produto: "))
            if valor <= 0 and str(valor):
                raise ValorNegativoError()  
 
            # Validação da embalagem
            embalagem = input("Digite o tipo de embalagem do produto: ")
            if not embalagem or embalagem.strip().lstrip('-').isdigit():
                raise ValorNaoNumericoError()  
            break
        except ValueError:
            print("Digite um valor válido\n") 
        except ValorNaoNumericoError as e:  
            print(e) 
        except ValorNegativoError as e:
            print(e)  

    icms = calcula_icms(valor)
    
    # Retorno do dicionário
    return {
        "descricao": descricao,
        "valor": valor,
        "embalagem": embalagem,
        "icms": icms
    }

# Criação de uma lista para guardar os dicionários de produtos
produtos = []

# C)
while True:
    # Adiciona produtos até o usuário dizer 'não'
    produtos.append(cadastrar_produto())
    continuar = input("Deseja cadastrar um novo produto? (sim/não): ").lower()
    if continuar != 'sim':
        break

# E)
if len(produtos) < 5:
    # Validação que garante o cadastro de no mínimo 5 produtos
    print("Você precisa cadastrar no mínimo 5 produtos.")
else:
    # Criação do arquivo .json
    with open("1_5_arquivo_produto.json", "w") as file:
        json.dump(produtos, file, indent=4)
    print("Arquivo JSON criado com sucesso!")