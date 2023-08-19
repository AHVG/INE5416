
presentes = []
min_presente = [10**9]
for _ in range(int(input())):
    operacao = input().split()
    if operacao[0] == "PUSH":
        valor = int(operacao[1])
        presentes.append(valor)
        if min_presente[-1] >= valor:
            min_presente.append(valor)
    elif len(presentes):
        if operacao[0] == "POP":
            if presentes[-1] == min_presente[-1]:
                min_presente.pop()
            presentes.pop()
        else:
            print(min_presente[-1])
    else:
        print("EMPTY")