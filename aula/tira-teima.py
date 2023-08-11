retangulo = {"V1": (0,0), "V2": (432,468)}
x, y = [int(z) for z in input().split()]
onde = "dentro" if retangulo["V1"][0] <= x <= retangulo["V2"][0] and retangulo["V1"][1] <= y <= retangulo["V2"][1] else "fora"
print(onde)