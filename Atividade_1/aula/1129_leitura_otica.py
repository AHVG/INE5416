while True:
    N = int(input())
    if not N:
        break
    for _ in range(N):
        gabarito_filtrado = [int(x) // 128 for x in input().split()]
        print("*" if sum(gabarito_filtrado) != 4 else chr(gabarito_filtrado.index(0) + 65))