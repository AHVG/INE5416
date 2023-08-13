def criar_folha(valor):
    folha = {"valor": valor, "E": None, "D": None}
    return folha.copy()

def na_ordem(arvore, saida):
    if arvore["E"] is not None:
        na_ordem(arvore["E"], saida)
    saida.append(arvore["valor"])
    if arvore["D"] is not None:
        na_ordem(arvore["D"], saida)

def pre_ordem(arvore, saida):
    saida.append(arvore["valor"])
    if arvore["E"] is not None:
        pre_ordem(arvore["E"], saida)
    if arvore["D"] is not None:
        pre_ordem(arvore["D"], saida)

def pos_ordem(arvore, saida):
    if arvore["E"] is not None:
        pos_ordem(arvore["E"], saida)
    if arvore["D"] is not None:
        pos_ordem(arvore["D"], saida)
    saida.append(arvore["valor"])

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
    saida = []
    pre_ordem(arvore, saida)
    print("Pre.: " + " ".join(list(map(str, saida))))
    saida = []
    na_ordem(arvore, saida)
    print("In..: " + " ".join(list(map(str, saida))))
    saida = []
    pos_ordem(arvore, saida)
    print("Post: " + " ".join(list(map(str, saida))))
    print()