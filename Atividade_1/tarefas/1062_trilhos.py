# while True:
#     numero_vagoes = int(input())
#     if numero_vagoes == 0:
#         break
#     vagoes = [i for i in range(numero_vagoes, 0, -1)]
#     while True:
#         vagoes_depois = input().split()
#         if len(vagoes_depois) == 1:
#             break
#         vagoes_depois = [int(x) for x in vagoes_depois[::-1]]

#         vagoes_antes = []
#         while len(vagoes_depois):
#             buffer = []
#             buffer.append(vagoes_depois.pop(0))
#             while len(vagoes_depois) and buffer[-1] == vagoes_depois[0] - 1:
#                 buffer.append(vagoes_depois.pop(0))
#             vagoes_antes.extend(buffer[::-1])
#         print("Yes") if all([a == b for a, b in zip(vagoes, vagoes_antes)]) else print("No")
#     print()

while True:
    numero_vagoes = int(input())
    if numero_vagoes == 0:
        break
    while True:
        vagoes = input().split()
        if len(vagoes) == 1:
            break
        vagoes = [int(x) for x in vagoes]

        pilha_de_vagoes = []
        vagao = 1
        while vagao <= numero_vagoes:
            pilha_de_vagoes.append(vagao)
            if vagoes[0] == vagao:
                pilha_de_vagoes.pop()
                vagoes.pop(0)
                while len(pilha_de_vagoes) and len(vagoes) and vagoes[0] == pilha_de_vagoes[-1]:
                    pilha_de_vagoes.pop()
                    vagoes.pop(0)
            vagao += 1

        print("Yes") if not len(pilha_de_vagoes) else print("No")
    print()