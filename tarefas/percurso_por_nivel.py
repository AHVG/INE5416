def criar_folha(valor):
    folha = {"valor": valor, "E": None, "D": None}
    return folha.copy()

def busca_em_largura(arvore):
    proximas_folhas = []
    folha_atual = arvore
    niveis = []
    while True:
        niveis.append(folha_atual)
        if folha_atual["E"]:
            proximas_folhas.append(folha_atual["E"])
        if folha_atual["D"]:
            proximas_folhas.append(folha_atual["D"])
        if not len(proximas_folhas):
            break
        folha_atual = proximas_folhas.pop(0)

    return niveis[:]


casos = int(input())
for caso in range(1, casos + 1):
    print(f"Case {caso}:")
    folhas = int(input())
    valores = list(map(int, input().split()))
    arvore = criar_folha(valores.pop(0))
    while len(valores):
        valor = valores.pop(0)
        folha_anterior = arvore
        folha_atual = arvore
        lado = ""
        while True:
            if folha_atual is None:
                if lado == "D":
                    folha_anterior["D"] = criar_folha(valor)
                else:
                    folha_anterior["E"] = criar_folha(valor)
                break
            folha_anterior = folha_atual
            if folha_atual["valor"] < valor:
                lado = "D"
                folha_atual = folha_atual["D"]
            else:
                lado = "E"
                folha_atual = folha_atual["E"]
    
    print(" ".join([str(folha["valor"]) for folha in busca_em_largura(arvore)]))
    print()
