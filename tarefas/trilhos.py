while True:
    numero_vagoes = int(input())
    if numero_vagoes == 0:
        break
    vagoes = [i for i in range(1, numero_vagoes + 1)]
    while True:
        vagoes_depois = input().split()
        if len(vagoes_depois) == 1:
            break
        vagoes_depois = [int(x) for x in vagoes_depois]

        vagoes_antes = []
        while len(vagoes_depois):
            buffer = []
            buffer.append(vagoes_depois.pop(0))
            while len(vagoes_depois) and buffer[-1] == 1 + vagoes_depois[0]:
                buffer.append(vagoes_depois.pop(0))
            vagoes_antes.extend(buffer[::-1])
        print("Yes") if all([a == b for a, b in zip(vagoes, vagoes_antes)]) else print("No")
    print()