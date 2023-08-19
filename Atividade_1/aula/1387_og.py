while True:
    L, R = [int(x) for x in input().split()]
    resultado = L + R
    if not resultado:
        break
    print(resultado)