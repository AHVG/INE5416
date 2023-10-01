import random
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


def eh_solucao(estado):
    for linha in estado:
        for elemento in linha:
            if elemento == 0:
                return False
    return True


def sem_solucao(estado, estado_de_possibilidades):
    for i, linha in enumerate(estado_de_possibilidades):
        for j, elemento in enumerate(linha):
            if not len(elemento) and not estado[i][j]:
                return True
    return False


def mostrar_matriz(estado):
    print()
    for linha in estado:
        for elemento in linha:
            print(elemento, end='')
        print()
    print()
        

def chutar(estado, estado_de_possibilidades):
    novo_estado = copy.copy(estado)
    
    # Obtendo os lugares possíveis para chute
    lugares_possiveis = []
    for l, linha in enumerate(estado_de_possibilidades):
        for c, elemento in enumerate(linha):
            if elemento:
                lugares_possiveis.append((l, c))
    
    # Escolhendo
    lugar = random.choice(lugares_possiveis)
    numero_escolhido = random.choice(estado_de_possibilidades[lugar[0]][lugar[1]])
    
    # Retirando e colocando
    estado_de_possibilidades[lugar[0]][lugar[1]].remove(numero_escolhido)
    novo_estado[lugar[0]][lugar[1]] = numero_escolhido
    return copy.copy(novo_estado)


def analisar_maior_menor():
    possibilidades = [[None for _ in range(9)] for _ in range(9)]
    for i, linha in enumerate(possibilidades):
        for j, elemento in enumerate(linha):
            maiores = sinais[i][j].count(MAIOR)
            menores = sinais[i][j].count(MENOR)
            possibilidades[i][j] = [i for i in range(menores + 1, 10 - maiores)]
    return copy.copy(possibilidades)


def analisar_coluna_linha(estado):
    possibilidades = [[[i for i in range(1, 10)] for _ in range(9)] for _ in range(9)]
    for i, linha in enumerate(estado):
        for j, elemento in enumerate(linha):
            if elemento:
                possibilidades[i][j] = []
                continue
            for k in range(9):
                if estado[i][k] and k != j and estado[i][k] in possibilidades[i][j]:
                    possibilidades[i][j].remove(estado[i][k])
                if estado[k][j] and k != i  and estado[k][j] in possibilidades[i][j]:
                    possibilidades[i][j].remove(estado[k][j])
    return copy.copy(possibilidades)


def analisar_bloco(estado):
    possibilidades = [[[i for i in range(1, 10)] for _ in range(9)] for _ in range(9)]
    for i, linha in enumerate(estado):
        for j, elemento in enumerate(linha):
            linha = (i // 3) * 3
            coluna = (j // 3) * 3
            for k in range(3):
                for h in range(3):
                    if linha + k == i and coluna + h == j:
                        continue
                    if estado[linha + k][coluna + h] and estado[linha + k][coluna + h] in possibilidades[i][j]:
                        possibilidades[i][j].remove(estado[linha + k][coluna + h])
    return copy.copy(possibilidades)

def juntar(*estados):
    resultado = [[set([i for i in range(1, 10)]) for _ in range(9)] for _ in range(9)]
    for estado in estados:
        for i, linha in enumerate(estado):
            for j, possibilidades in enumerate(linha):
                resultado[i][j] = resultado[i][j].intersection(set(possibilidades))
    return copy.copy([[list(i) for i in linha] for linha in resultado])


def calcular_estado_de_possibilidades(estado):
    possibilidades_1 = analisar_maior_menor()
    possibilidades_2 = analisar_coluna_linha(estado)
    possibilidades_3 = analisar_bloco(estado)
    return juntar(possibilidades_1, possibilidades_2, possibilidades_3)


def resolver():
    # Setup
    estado = [[0 for _ in range(9)] for _ in range(9)]
    estado_de_possibilidades = calcular_estado_de_possibilidades(estado)
    estados = [estado]
    estados_de_possibilidades = [estado_de_possibilidades]

    # Algoritmo
    while not eh_solucao(estado):
        # for e in estados:
        #     mostrar_matriz(e)
        # mostrar_matriz(estado)
        # mostrar_matriz(estado_de_possibilidades)
        if sem_solucao(estado, estado_de_possibilidades):
            estados.pop()
            estados_de_possibilidades.pop()
            estado = estados[-1]
            estado_de_possibilidades = estados_de_possibilidades[-1]
        else:
            estado = chutar(estado, estado_de_possibilidades)
            estado_de_possibilidades = calcular_estado_de_possibilidades(estado)
            estados.append(estado)
            estados_de_possibilidades.append(estado_de_possibilidades)
        mostrar_matriz(estado)
        # input()
    
    # Resultado
    mostrar_matriz(estado)


if __name__ == "__main__":
    resolver()
