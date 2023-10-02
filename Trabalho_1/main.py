import copy
import time

from dataclasses import dataclass


NADA, MENOR, MAIOR = 0, 1, 2


@dataclass
class Casa:

    esquerda: int = NADA
    direita: int = NADA
    baixo: int = NADA
    cima: int = NADA
    maiores: int = 0
    menores: int = 0


def medir_tempo(funcao):
    def wrapper(*args, **kwargs):
        inicio = time.time()
        resultado = funcao(*args, **kwargs)
        fim = time.time()
        tempo_de_execucao = fim - inicio
        print(f"A função {funcao.__name__} levou {tempo_de_execucao} segundos para ser executada.")
        return resultado
    return wrapper


def fazer_tabuleiro_sinais(resposta):
    resultado = [[None for _ in range(9)] for _ in range(9)]

    for i, linha in enumerate(resposta):
        for j, elemento in enumerate(linha):
            casa = Casa()
            bloco_x = j // 3
            bloco_y = i // 3
            x, y = j, i - 1
            if bloco_x * 3 - 1 < x < (bloco_x + 1) * 3 and bloco_y * 3 - 1 < y < (bloco_y + 1) * 3:
                if elemento > resposta[y][x]:
                    casa.cima = MAIOR
                else:
                    casa.cima = MENOR

            x, y = j + 1, i
            if bloco_x * 3 - 1 < x < (bloco_x + 1) * 3 and bloco_y * 3 - 1 < y < (bloco_y + 1) * 3:
                if elemento > resposta[y][x]:
                    casa.direita = MAIOR
                else:
                    casa.direita = MENOR

            x, y = j, i + 1
            if bloco_x * 3 - 1 < x < (bloco_x + 1) * 3 and bloco_y * 3 - 1 < y < (bloco_y + 1) * 3:
                if elemento > resposta[y][x]:
                    casa.baixo = MAIOR
                else:
                    casa.baixo = MENOR
            
            x, y = j - 1, i
            if bloco_x * 3 - 1 < x < (bloco_x + 1) * 3 and bloco_y * 3 - 1 < y < (bloco_y + 1) * 3:
                if elemento > resposta[y][x]:
                    casa.esquerda = MAIOR
                else:
                    casa.esquerda = MENOR
    
            resultado[i][j] = casa
    percorrer_sinais(resultado)
    return resultado


def percorrer_sinais(sinais):
    for i, linha in enumerate(sinais):
        for j, casa in enumerate(linha):
            casa.maiores = percorrer_sinal(sinais, (j, i), MAIOR)
            casa.menores = percorrer_sinal(sinais, (j, i), MENOR)


def percorrer_sinal(sinais, posicao, sinal):
    # TODO: Arrumar o set
    posicoes_visitadas = []
    posicoes_a_serem_visistadas = [posicao]
    while len(posicoes_a_serem_visistadas):
        p = posicoes_a_serem_visistadas.pop(0)
        posicoes_visitadas.append(p)
        casa = sinais[p[1]][p[0]]
        if casa.cima == sinal:
            aux = (p[0], p[1] - 1)
            if aux not in posicoes_visitadas:
                posicoes_a_serem_visistadas.append(aux)
        if casa.baixo == sinal:
            aux = (p[0], p[1] + 1)
            if aux not in posicoes_visitadas:
                posicoes_a_serem_visistadas.append(aux)
        if casa.esquerda == sinal:
            aux = (p[0] - 1, p[1])
            if aux not in posicoes_visitadas:
                posicoes_a_serem_visistadas.append(aux)
        if casa.direita == sinal:
            aux = (p[0] + 1, p[1])
            if aux not in posicoes_visitadas:
                posicoes_a_serem_visistadas.append(aux)
    return len(set(posicoes_visitadas)) - 1


def eh_solucao(estado):
    for linha in estado:
        for elemento in linha:
            if not elemento:
                return False
    return True


def obter_possibilidades(estado, posicao):
    x, y = posicao
    # Maior Menor
    casa = sinais[y][x]
    maior = 9 - casa.menores
    menor = casa.maiores
    if casa.cima == MAIOR:
        if estado[y - 1][x] and menor < estado[y - 1][x]:
            menor = estado[y - 1][x]
    elif casa.cima == MENOR:
        if estado[y - 1][x] and maior > estado[y - 1][x]:
            maior = estado[y - 1][x]
    
    if casa.direita == MAIOR:
        if estado[y][x + 1] and menor < estado[y][x + 1]:
            menor = estado[y][x + 1]
    elif casa.direita == MENOR:
        if estado[y][x + 1] and menor > estado[y][x + 1]:
            maior = estado[y][x + 1]

    if casa.baixo == MAIOR:
        if estado[y + 1][x] and menor < estado[y + 1][x]:
            menor = estado[y + 1][x]
    elif casa.baixo == MENOR:
        if estado[y + 1][x] and maior > estado[y + 1][x]:
            maior = estado[y + 1][x]

    if casa.esquerda == MAIOR:
        if estado[y][x - 1] and menor < estado[y][x - 1]:
            menor = estado[y][x - 1]
    elif casa.esquerda == MENOR:
        if estado[y][x - 1] and maior > estado[y][x - 1]:
            maior = estado[y][x - 1]
    possibilidades = [i for i in range(menor + 1, maior + 1)]
    # linha e coluna
    for k in range(9):
        if k != y and estado[k][x] in possibilidades:
            possibilidades.remove(estado[k][x])
        if k != x and estado[y][k] in possibilidades:
            possibilidades.remove(estado[y][k])
    # bloco
    linha = (y // 3) * 3
    coluna = (x // 3) * 3
    for i in range(3):
        for j in range(3):
            if (linha + i != y or coluna + j != x) and estado[linha + i][coluna + j] in possibilidades:
                possibilidades.remove(estado[linha + i][coluna + j])
    return copy.deepcopy(possibilidades)


def obter_posicao_mais_restrita(estado):
    posicao = [0,0]
    possibilidades = 10
    for i, linha in enumerate(estado):
        for j, elemento in enumerate(linha):
            if not elemento:
                nova_posicao = (j, i)
                nova_possibilidades = len(obter_possibilidades(estado, nova_posicao))
                if possibilidades > nova_possibilidades:
                    possibilidades = nova_possibilidades
                    posicao = nova_posicao
    if not possibilidades:
        return None
    return copy.deepcopy(posicao)


def sem_solucao(estado):
    for i in range(9):
        for j in range(9):
            if not len(obter_possibilidades(estado, (j, i))):
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

    if eh_solucao(estado):
        return copy.deepcopy(estado)

    if sem_solucao(estado):
        return None

    posicao_mais_restrita = obter_posicao_mais_restrita(estado)
    for possibilidade in obter_possibilidades(estado, posicao_mais_restrita):
        novo_estado = copy.deepcopy(estado)
        novo_estado[posicao_mais_restrita[1]][posicao_mais_restrita[0]] = possibilidade
        if resposta := resolver(novo_estado, profundidade + 1):
            return resposta
    return None


def confirmar(resultado, resposta):
    for i in range(9):
        for j in range(9):
            if resultado[i][j] != resposta[i][j]:
                return False
    return True


resposta = [[1, 8, 4, 2, 7, 6, 5, 3, 9],
            [3, 9, 7, 5, 4, 8, 2, 1, 6],
            [2, 6, 5, 3, 1, 9, 8, 7, 4],
            [5, 2, 8, 1, 9, 4, 7, 6, 3],
            [4, 7, 3, 8, 6, 2, 1, 9, 5],
            [6, 1, 9, 7, 5, 3, 4, 8, 2],
            [8, 5, 6, 9, 2, 7, 3, 4, 1],
            [7, 4, 2, 6, 3, 1, 9, 5, 8],
            [9, 3, 1, 4, 8, 5, 6, 2, 7]] # Nr. 123

resposta = [[9, 2, 3, 5, 4, 7, 1, 6, 8],
            [6, 4, 7, 1, 9, 8, 5, 3, 2],
            [5, 1, 8, 6, 3, 2, 7, 9, 4],
            [4, 7, 5, 9, 2, 1, 3, 8, 6],
            [1, 9, 6, 3, 8, 5, 4, 2, 7],
            [3, 8, 2, 4, 7, 6, 9, 5, 1],
            [7, 5, 4, 2, 6, 9, 8, 1, 3],
            [8, 6, 9, 7, 1, 3, 2, 4, 5],
            [2, 3, 1, 8, 5, 4, 6, 7, 9]] # Nr. 125
sinais = fazer_tabuleiro_sinais(resposta)


@medir_tempo
def main():
    # see: https://www.janko.at/Raetsel/Sudoku/Vergleich/index.htm
    print("Resposta:", confirmar(resolver([[0 for _ in range(9)] for _ in range(9)], 0), resposta))


if __name__ == "__main__":
    main()
