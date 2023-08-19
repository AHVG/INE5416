teste = 1
notas = [50, 10, 5, 1]
quantidades = [0, 0, 0, 0]
while True:
    valor = int(input())
    if not valor:
        break
    for i, nota in enumerate(notas):
        quantidade_nota = valor // nota
        valor -= quantidade_nota * nota
        quantidades[i] = quantidade_nota
        quantidades[i] = str(quantidades[i])
    
    print(f"Teste {teste}")
    print(" ".join(quantidades))
    print()
    teste += 1