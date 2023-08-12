
while True:
    try:
        expressao = input()
    except:
        break
    parenteses = []
    for t in expressao:
        if t == "(":
            parenteses.append("(")
        elif t == ")": 
            if len(parenteses):
                parenteses.pop()
            else:
                parenteses.append("(")
                break
    print("incorrect") if len(parenteses) else print("correct")
    