
while True:
    numero_de_cartas = int(input())
    if not numero_de_cartas:
        break
    cartas = [i for i in range(1, numero_de_cartas + 1)]
    sequencia_de_descarte = []
    while len(cartas) > 1:
        sequencia_de_descarte.append(str(cartas.pop(0)))
        cartas.append(cartas.pop(0))
    print("Discarded cards: " + ", ".join(sequencia_de_descarte))
    print("Remaining card:", cartas[0])
