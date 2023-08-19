notas = [100, 50, 20, 10, 5, 2, 1]
valor = int(input())
print(valor)
for nota in notas:
    quantidade_nota = valor // nota
    valor -= quantidade_nota * nota
    print(f"{quantidade_nota} nota(s) de R$ {nota},00")