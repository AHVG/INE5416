main = do
    strNum <- getLine
    let n1 = (read strNum :: Int)
    strNum <- getLine
    let n2 = (read strNum :: Int)
    let resultado = n1 + n2
    print resultado