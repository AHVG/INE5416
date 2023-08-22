avalia :: Float -> Float -> Float -> String
avalia a b c | (a + b + c >= 18) = "aprovado"
avalia a b c | otherwise = "reprovado"

main = do
    strNota <- getLine
    let n1 = (read strNota :: Float)
    strNota <- getLine
    let n2 = (read strNota :: Float)
    strNota <- getLine
    let n3 = (read strNota :: Float)
    print (avalia n1 n2 n3)