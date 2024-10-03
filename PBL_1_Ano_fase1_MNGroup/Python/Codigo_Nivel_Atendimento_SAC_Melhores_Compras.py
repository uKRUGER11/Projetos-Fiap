"""
O índice de satisfação do cliente vai de 0 a 100. As classificações são as seguintes: 
se a nota for maior que 90, o atendimento é considerado de qualidade; 
se a nota estiver entre 70 e 89, o atendimento é neutro; 
e qualquer nota abaixo de 70 é vista como insatisfatória. 

Para criar um algoritmo em Python, o programa deve solicitar a nota de satisfação como entrada e, 
com base nas faixas definidas, imprimir uma mensagem que indica se o atendimento foi bom, neutro ou ruim. 
"""
msg = "Digite uma nota de 1 a 100 para avaliar o atendimento, sendo 100 a melhor pontuação. Contamos com sua opinião!\n"

def recebe_nota():
    var = int(input(msg))
    while (var < 1) or (var > 100):
        print("\nValor inválido! Tente novamente:\n")
        var = recebe_nota()
    return var


nota_satisfacao = recebe_nota()

if ((nota_satisfacao >= 90) and (nota_satisfacao <= 100) ):
    print(f"\n nota: {nota_satisfacao}, Atendimento de qualidade")
elif ((nota_satisfacao >= 70) and (nota_satisfacao < 90)):
    print(f"\n nota: {nota_satisfacao}, Atendimento neutro")
elif (nota_satisfacao < 70):
    print(f"\n nota: {nota_satisfacao}, Atendimento insatisfatório")

print("\n Obrigado pela avaliação!")

