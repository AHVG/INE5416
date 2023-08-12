import bisect
caso = 1
while True:
    pecas = []
    N, Q = [int(x) for x in input().split()]
    if N == 0 and Q == 0:
        break
    for _ in range(N):
        pecas.append(int(input()))
    pecas.sort()
    print(f"CASE# {caso}:")
    for _ in range(Q):
        peca = int(input())
        indice = bisect.bisect_left(pecas, peca)
        if indice < len(pecas) and pecas[indice] == peca:
            print(f"{peca} found at {indice + 1}")
        else:
            print(f"{peca} not found")
    caso += 1