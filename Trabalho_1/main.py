
def sem_solucao(estado):
    pass


def obter_posicao_mais_restrita(estado):
    pass


def obter_possibilidades(estado, posicao):
    pass


def resolver(estado):
    if eh_solucao(estado):
        print()
        for linha in estado:
            for elemento in linha:
                print(elemento, end=" ")
            print()
        print()
        return True

    if sem_solucao(estado):
        return False

    posicao_mais_restrita = obter_posicao_mais_restrita(estado)
    for possibilidades in obter_possibilidades(estado, posicao_mais_restrita):
        if resolver(estado):
            return True
    return False


def main():
    estado = [[0 for _ in range(9)] for _ in range(9)]
    sinais = None

    resolver(estado)


if __name__ == "__main__":
    main()
