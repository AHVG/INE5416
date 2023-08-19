while True:
    numero_de_amostras = int(input())
    if not numero_de_amostras:
        break
    amostras = list(map(int, input().split()))

    picos = 0
    for i, amostra in enumerate(amostras):
        amostra_anterior = amostras[i - 1] if i != 0 else amostras[-1]
        amostra_posterior = amostras[i + 1] if i != len(amostras) - 1 else amostras[0]
        if amostra_anterior < amostra > amostra_posterior or amostra_anterior > amostra < amostra_posterior:
            picos += 1
    print(picos)