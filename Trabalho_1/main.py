import copy


MAIOR = 2
MENOR = 1
NADA = 0


def fazer_tabuleiro_sinais(resposta):
    resultado = [[None for _ in range(9)] for _ in range(9)]

    for i, linha in enumerate(resposta):
        for j, elemento in enumerate(linha):
            sinais_elemento = {"E": NADA, "D": NADA, "B": NADA, "C": NADA, ">": 0, "<": 0}
            bloco_x = j // 3
            bloco_y = i // 3
            x, y = j, i - 1
            if bloco_x * 3 - 1 < x < (bloco_x + 1) * 3 and bloco_y * 3 - 1 < y < (bloco_y + 1) * 3:
                if elemento > resposta[y][x]:
                    sinais_elemento["C"] = MAIOR
                    sinais_elemento[">"] += 1
                else:
                    sinais_elemento["C"] = MENOR
                    sinais_elemento["<"] += 1

            x, y = j + 1, i
            if bloco_x * 3 - 1 < x < (bloco_x + 1) * 3 and bloco_y * 3 - 1 < y < (bloco_y + 1) * 3:
                if elemento > resposta[y][x]:
                    sinais_elemento["D"] = MAIOR
                    sinais_elemento[">"] += 1
                else:
                    sinais_elemento["D"] = MENOR
                    sinais_elemento["<"] += 1

            x, y = j, i + 1
            if bloco_x * 3 - 1 < x < (bloco_x + 1) * 3 and bloco_y * 3 - 1 < y < (bloco_y + 1) * 3:
                if elemento > resposta[y][x]:
                    sinais_elemento["B"] = MAIOR
                    sinais_elemento[">"] += 1
                else:
                    sinais_elemento["B"] = MENOR
                    sinais_elemento["<"] += 1
            
            x, y = j - 1, i
            if bloco_x * 3 - 1 < x < (bloco_x + 1) * 3 and bloco_y * 3 - 1 < y < (bloco_y + 1) * 3:
                if elemento > resposta[y][x]:
                    sinais_elemento["E"] = MAIOR
                    sinais_elemento[">"] += 1
                else:
                    sinais_elemento["E"] = MENOR
                    sinais_elemento["<"] += 1
    
            resultado[i][j] = sinais_elemento.copy()

    return resultado


def eh_solucao(estado):
    for linha in estado:
        for elemento in linha:
            if not elemento:
                return False
    return True


def obter_possibilidades(estado, posicao):
    x, y = posicao
    # Maior Menor
    sinais_elemento = sinais[y][x]
    maior = 9 - sinais_elemento[">"]
    menor = sinais_elemento["<"]
    if sinais_elemento["C"] == MAIOR:
        if estado[y - 1][x] and maior > estado[y - 1][x]:
            maior = estado[y - 1][x]
    elif sinais_elemento["C"] == MENOR:
        if estado[y - 1][x] and menor < estado[y - 1][x]:
            menor = estado[y - 1][x]
    
    if sinais_elemento["D"] == MAIOR:
        if estado[y][x + 1] and maior > estado[y][x + 1]:
            maior = estado[y][x + 1]
    elif sinais_elemento["D"] == MENOR:
        if estado[y][x + 1] and menor < estado[y][x + 1]:
            menor = estado[y][x + 1]

    if sinais_elemento["B"] == MAIOR:
        if estado[y + 1][x] and maior > estado[y + 1][x]:
            maior = estado[y + 1][x]
    elif sinais_elemento["B"] == MENOR:
        if estado[y + 1][x] and menor < estado[y + 1][x]:
            menor = estado[y + 1][x]

    if sinais_elemento["E"] == MAIOR:
        if estado[y][x - 1] and maior > estado[y][x - 1]:
            maior = estado[y][x - 1]
    elif sinais_elemento["E"] == MENOR:
        if estado[y - 1][x - 1] and menor < estado[y][x - 1]:
            menor = estado[y][x - 1]
    possibilidades = [i for i in range(menor + 1, maior)]
    print(menor, maior)
    print(possibilidades)
    # linha e coluna
    for k in range(9):
        if k != y and estado[k][x] in possibilidades:
            possibilidades.remove(estado[k][x])
        if k != x and estado[y][k] in possibilidades:
            possibilidades.remove(estado[y][k])
    # bloco
    for i in range(3):
        for j in range(3):
            linha = y // 3
            coluna = x // 3
            if linha != y and coluna != x and estado[linha + i][coluna + j] in possibilidades:
                possibilidades.remove(estado[linha + i][coluna + j])
    print(possibilidades)
    return copy.deepcopy(possibilidades)


def obter_posicao_mais_restrita(estado):
    posicao = [0,0]
    possibilidades = 10
    for i, linha in enumerate(estado):
        for j, elemento in enumerate(linha):
            if not elemento:
                nova_posicao = (j, i)
                nova_possibilidades = len(obter_possibilidades(estado, nova_posicao))
                # print(i, j, obter_possibilidades(estado, nova_posicao))
                if possibilidades > nova_possibilidades:
                    possibilidades = nova_possibilidades
                    posicao = nova_posicao
    
    if not possibilidades:
        return None
    return copy.deepcopy(posicao)


def sem_solucao(estado):
    posicao = obter_posicao_mais_restrita(estado)
    if not posicao:
        return True
    return False


def mostrar_matriz(matriz):
    print()
    for linha in matriz:
        for elemento in linha:
            print(elemento, end=" ")
        print()
    print()


def resolver(estado, profundidade):
    print(f"Estado da pronfundidade {profundidade}\n")
    mostrar_matriz(estado)
    mostrar_matriz(sinais)
    input()

    if eh_solucao(estado):
        mostrar_matriz(estado)
        return True

    if sem_solucao(estado):
        return False

    posicao_mais_restrita = obter_posicao_mais_restrita(estado)
    for possibilidade in obter_possibilidades(estado, posicao_mais_restrita):
        novo_estado = copy.deepcopy(estado)
        novo_estado[posicao_mais_restrita[1]][posicao_mais_restrita[0]] = possibilidade
        if resolver(novo_estado, profundidade + 1):
            return True
    return False


resposta = [[9, 8, 6, 3, 5, 4, 2, 7, 1],
            [2, 7, 5, 9, 6, 1, 8, 4, 3],
            [3, 4, 1, 8, 2, 7, 9, 6, 5],
            [8, 1, 2, 4, 3, 9, 6, 5, 7],
            [4, 3, 9, 5, 7, 6, 1, 2, 8],
            [5, 6, 7, 2, 1, 8, 4, 3, 9],
            [7, 9, 8, 6, 4, 3, 5, 1, 2],
            [6, 5, 3, 1, 8, 2, 7, 9, 4],
            [1, 2, 4, 7, 9, 5, 3, 8, 6]]
sinais = fazer_tabuleiro_sinais(resposta)


def main():
    estado = [[0 for _ in range(9)] for _ in range(9)]
    resolver(estado, 0)


if __name__ == "__main__":
    main()
