def passo_1(texto):
    return "".join([chr(ord(c) + 3) if c.isalpha() else c for c in texto])

def passo_2(texto):
    return texto[::-1]

def passo_3(texto):
    return "".join([chr(ord(c) - 1) if i >= len(texto)//2 else c for i, c in enumerate(texto)])

criptografia = "\n".join([passo_3(passo_2(passo_1(input()))) for _ in range(int(input()))])
print(criptografia)