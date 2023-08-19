
def encontrar_minimo(presentes):
    m = 10**9
    for presente in presentes:
        if presente < m:
            m = presente
    return m

minimo = 10**9
presentes = []
for _ in range(int(input())):
    operacao = input().split()
    if operacao[0] == "PUSH":
        valor = int(operacao[1])
        presentes.append(valor)
        if valor < minimo:
            minimo = valor
    elif len(presentes):
        if operacao[0] == "POP":
            valor = presentes.pop()
            if valor == minimo:
                minimo = encontrar_minimo(presentes)
        else:
            print(minimo)