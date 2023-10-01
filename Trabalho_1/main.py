import copy


MAIOR = 2
MENOR = 1
NADA = 0


def fazer_tabuleiro_sinais(resposta):
    resultado = [[[] for _ in range(9)] for _ in range(9)]

    for i, linha in enumerate(resposta):
        for j, elemento in enumerate(linha):
            for d in range(-1, 2, 2):
                if -1 < j < 9 and -1 < i + d < 9 and i // 3 == (i + d) // 3:
                    if resposta[i + d][j] > elemento:
                        resultado[i][j].append(MENOR)
                    else:
                        resultado[i][j].append(MAIOR)
                else:
                    resultado[i][j].append(NADA)

                if -1 < j + d < 9 and -1 < i < 9 and j // 3 == (j + d) // 3:
                    if resposta[i][j + d] > elemento:
                        resultado[i][j].append(MENOR)
                    else:
                        resultado[i][j].append(MAIOR)
                else:
                    resultado[i][j].append(NADA)

    return resultado


def eh_solucao(estado):
    for linha in estado:
        for elemento in linha:
            if not elemento:
                return False
    return True


def obter_possibilidades(estado, posicao):
    possibilidades = [i for i in range(1, 10)]
    x, y = posicao
    # Maior Menor
    for 

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
    return copy.copy(possibilidades)


def obter_posicao_mais_restrita(estado):
    posicao = [0,0]
    possibilidades = 10
    for i, linha in enumerate(estado):
        for j, elemento in enumerate(linha):
            if not elemento:
                nova_posicao, nova_possibilidades = (j, i), len(obter_possibilidades(estado, nova_posicao))
                if possibilidades > nova_possibilidades:
                    possibilidades = nova_possibilidades
                    posicao = nova_posicao
    if not possibilidades:
        return None
    return copy.copy(posicao)


def sem_solucao(estado):
    posicao = obter_posicao_mais_restrita()
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


def resolver(estado):

    if eh_solucao(estado):
        mostrar_matriz(estado)
        return True

    if sem_solucao(estado):
        return False

    posicao_mais_restrita = obter_posicao_mais_restrita(estado)
    for possibilidade in obter_possibilidades(estado, posicao_mais_restrita):
        novo_estado = copy.copy(estado)
        novo_estado[posicao_mais_restrita[1]][posicao_mais_restrita[0]] = possibilidade
        if resolver(novo_estado):
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
    resolver(estado)


if __name__ == "__main__":
    main()
