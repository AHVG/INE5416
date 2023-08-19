import bisect

def descobrir_casas(casas, soma):
    for casa in casas:
        indice = bisect.bisect_left(casas, soma - casa)
        if -1 < indice < len(casas) and casas[indice] + casa == soma:
            return str(casa), str(casas[indice])
    return "-1", "-1"

print(" ".join(descobrir_casas([int(input()) for _ in range(int(input()))], int(input()))))

