
aplicaOperacao :: (Double -> Double -> Double) -> Double -> Double -> Double
aplicaOperacao op x y = x `op` y

mapeamentoOperacao :: String -> (Double -> Double -> Double)
mapeamentoOperacao op | (op == "+") = (+)
mapeamentoOperacao op | (op == "-") = (-)
mapeamentoOperacao op | (op == "/") = (/)
mapeamentoOperacao op | (op == "*") = (*)
mapeamentoOperacao op | otherwise   = (+)


main :: IO()
main = do

    x <- readLn :: IO Double
    y <- readLn :: IO Double
    op <- getLine

    print (aplicaOperacao (mapeamentoOperacao (op)) x y)
