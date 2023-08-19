
def eh_valida(expressao):
    delimitadores = []
    mapeamento_abre_para_fecha = {"{": "}", "(": ")", "[": "]",}
    for c in expressao:
        if c == "{" or c == "[" or c == "(":
            delimitadores.append(mapeamento_abre_para_fecha[c])
        elif c == "}" or c == "]" or c == ")":
            if not len(delimitadores) or delimitadores[-1] != c:
                return "N"
            delimitadores.pop()
    return "N" if len(delimitadores) else "S"


for _ in range(int(input())):
    expressao = input()
    print(eh_valida(expressao))