pedras, sapos = [int(x) for x in input().split()]
resultado = [0 for _ in range(pedras)]
for _ in range(sapos):
    posicao, pulo = [int(x) for x in input().split()]
    resultado[posicao - 1] = 1
    for p in range(posicao - 1, pedras, pulo):
        resultado[p] = 1
    for p in range(posicao - 1, -1, -pulo):
        resultado[p] = 1
for i in resultado:
    print(i)