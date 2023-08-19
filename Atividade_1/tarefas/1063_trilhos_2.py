while True:
    numero_vagoes = int(input())
    if numero_vagoes == 0:
        break
    vagoes = input().split()
    vagoes_desejado = input().split()
    pilha_de_vagoes = []
    vagao = 1
    while len(vagoes):
        pilha_de_vagoes.append(vagoes.pop(0))
        print("I", end="")
        if vagoes_desejado[0] == pilha_de_vagoes[-1]:
            pilha_de_vagoes.pop()
            vagoes_desejado.pop(0)
            print("R", end="")
            while len(pilha_de_vagoes) and len(vagoes_desejado) and vagoes_desejado[0] == pilha_de_vagoes[-1]:
                pilha_de_vagoes.pop()
                vagoes_desejado.pop(0)
                print("R", end="")
        
    print(" Impossible") if len(pilha_de_vagoes) else print()