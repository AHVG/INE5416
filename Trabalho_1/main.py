import random
import copy


def eh_solucao(estado):
    for linha in estado:
        for elemento in linha:
            if elemento == 0:
                return False
    return True


def sem_solucao(estado_de_possibilidades):
    for linha in estado_de_possibilidades:
        for elemento in linha:
            if elemento and not len(elemento):
                return True
    return False


def mostrar_estado(estado):
    for linha in estado:
        for elemento in linha:
            print(elemento, end='')
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
    return novo_estado


def calcular_estado_de_possibilidades(estado):
    # Fazer aquele algoritmo trivial, sem fazer uma busca
    pass


def resolver():
    
    # Setup
    estado = [[0] * 9] * 9
    estado_de_possibilidades = calcular_estado_de_possibilidades(estado)
    estados = [estado]
    estados_de_possibilidades = [estado_de_possibilidades]
    mostrar_estado(estado)
    mostrar_estado(estado_de_possibilidades)

    # Algoritmo
    while not eh_solucao(estado):
        if sem_solucao(estado_de_possibilidades):
            estados.pop()
            estados_de_possibilidades.pop()
            estado = estados[-1]
            estado_de_possibilidades = estados_de_possibilidades[-1]
        else:
            estado = chutar(estado, estado_de_possibilidades)
            estado_de_possibilidades = calcular_estado_de_possibilidades(estado)
            estados.append(estado)
            estados_de_possibilidades.append(estado_de_possibilidades)
            
    
    # Resultado
    mostrar_estado(estado)


if __name__ == "__main__":
    resolver()
