N = int(input())
for _ in range(N):
    terra = input()
    pedaco_de_diamante = []
    numero_de_diamantes = 0
    for t in terra:
        if t == "<":
            pedaco_de_diamante.append("<")
        elif t == ">" and len(pedaco_de_diamante): 
            pedaco_de_diamante.pop()
            numero_de_diamantes += 1
    print(numero_de_diamantes)
    