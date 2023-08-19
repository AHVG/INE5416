while True:
    K = int(input())
    if not K:
        break
    xo, yo = [int(z) for z in input().split()]
    for _ in range(K):
        x, y = [int(z) for z in input().split()]
        regiao = ""
        if x == xo or y == yo:
            regiao = "divisa"
        else:
            regiao = "N" if y > yo else "S"
            regiao += "E" if x > xo else "O"
        print(regiao)