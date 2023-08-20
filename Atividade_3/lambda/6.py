# A função map aplica uma dada função passada por parâmetro em cada um dos elementos de um iteravel (lista, tupla e etc...)
# Até agora, para pegar as informações da entrda do usuário, foi utilizado a função map para converter str para int ou float

# A função abaixo pega dois valores colocados na entrada como string, os converte para int e, em seguida, envia como parametro
# a função lambada.
print((lambda x, y: x + y)(*list(map(int, input().split()))))
