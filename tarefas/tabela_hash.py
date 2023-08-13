testes = int(input())
for teste in range(testes):
    numero_de_posicoes, _ = list(map(int, input().split()))
    tabela = [[i] for i in range(0, numero_de_posicoes)]
    dispersao = lambda x: x % numero_de_posicoes
    valores = list(map(int, input().split()))
    for valor in valores:
        tabela[dispersao(valor)].append(valor)
    for linha in tabela:
        linha = list(map(str, linha))
        linha.append("\\")
        print(" -> ".join(linha))
    if teste < testes - 1:
        print()