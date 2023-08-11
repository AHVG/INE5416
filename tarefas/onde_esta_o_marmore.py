caso = 1
while True:
    pecas = []
    N, Q = [int(x) for x in input().split()]
    if N == 0 and Q == 0:
        break
    for _ in range(N):
        pecas.append(int(input()))
    print(f"CASE# {caso}:")
    for _ in range(Q):
        peca = int(input())
        indice = 0
        if peca in pecas:
            for p in pecas:
                if p < peca:
                    indice += 1
            print(f"{peca} found at {indice + 1}")
        else:
            print(f"{peca} not found")
    caso += 1