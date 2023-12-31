
alunos :: [(Int, String, Float)]
alunos = [(1, "Ana", 3.4), (2, "Bob", 6.7), (3, "Tom", 7.6)]

getNome :: (Int, String, Float) -> String
getNome (a,b,c) = b

getNota :: (Int, String, Float) -> Float
getNota (a,b,c) = c

getPrimeiroAluno :: [(Int, String, Float)] -> (Int, String, Float)
getPrimeiroAluno (a:_) = a

gerarPares :: [t] -> [u] -> [(t,u)] 
gerarPares l1 l2 = [(a,b) | a <- l1, b <- l2]

aprovados :: [(Int, String, Float)] -> [String]
aprovados x | (x == []) = []
aprovados (x:resto) | (getNota x >= 6.0) = getNome x : aprovados resto
aprovados (x:resto) | otherwise = aprovados resto

main = do
    print (aprovados alunos)

