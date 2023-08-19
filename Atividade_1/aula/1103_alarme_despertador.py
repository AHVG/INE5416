while True:
    h1, m1, h2, m2 = [int(x) for x in input().split()]
    if h1 == 0 and h2 == 0 and m1 == 0 and m2 == 0:
        break
    minutos = 0
    if (h1 > h2) or (h1 == h2 and m1 > m2):
        minutos2 = (h2 + 24) * 60
    else:
        minutos2 = h2 * 60
    minutos1 = h1 * 60 + m1
    minutos2 += m2
    print(f"{minutos2 - minutos1}")