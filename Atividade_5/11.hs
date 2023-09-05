primeiros :: Int -> [t] -> [t]
primeiros _ [] = []
primeiros n _ | (n == 0) = []
primeiros n (x:resto) = x : primeiros (n - 1) resto

main = do
    print (primeiros 3 ["oi", "tchau", "tudo bem", "como foi o final de semana", "uhul, lista de paradigmas"])

