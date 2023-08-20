
# presentes = []
# min_presente = [10**9]
# comprimento = 0
# for _ in range(int(input())):
#     operacao = input().split()
#     if operacao[0] == "PUSH":
#         valor = int(operacao[1])
#         presentes.append(valor)
#         if min_presente[-1] >= valor:
#             min_presente.append(valor)
#         comprimento += 1
#     elif comprimento:
#         if operacao[0] == "POP":
#             if presentes[-1] == min_presente[-1]:
#                 min_presente.pop()
#             presentes.pop()
#             comprimento -= 1
#         else:
#             print(min_presente[-1])
#     else:
#         print("EMPTY")

presentes = []
comprimento = 0
for _ in range(int(input())):
    operacao = input().split()
    if operacao[0] == "PUSH":
        valor = int(operacao[1])
        presentes.append(valor)
        comprimento += 1
    elif comprimento:
        if operacao[0] == "POP":
            presentes.pop()
            comprimento -= 1
        else:
            print(min(presentes))
    else:
        print("EMPTY")