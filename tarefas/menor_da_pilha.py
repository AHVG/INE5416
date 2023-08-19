
presentes = []
for _ in range(int(input())):
    operacao = input().split()
    if operacao[0] == "PUSH":
        presentes.append(int(operacao[1]))
    elif len(presentes):
        if operacao[0] == "POP":
            presentes.pop()
        else:
            print(min(presentes))
    else:
        print("EMPTY")