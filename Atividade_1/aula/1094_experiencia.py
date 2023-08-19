animais = {'R': 0, 'S': 0, 'C': 0}
total = 0
for _ in range(int(input())):
    quantidade, animal = input().split()
    quantidade = int(quantidade)
    animais[animal] += quantidade
    total += quantidade
    
print(f"Total: {total} cobaias")
print(f"Total de coelhos: {animais['C']}")
print(f"Total de ratos: {animais['R']}")
print(f"Total de sapos: {animais['S']}")
print(f"Percentual de coelhos: {100 * animais['C'] / total:.2f} %")
print(f"Percentual de ratos: {100 * animais['R'] / total:.2f} %")
print(f"Percentual de sapos: {100 * animais['S'] / total:.2f} %")