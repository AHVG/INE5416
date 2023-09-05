
alunos :: [(Int, String, Float)]
alunos = [(1, "Ana", 3.4), (2, "Bob", 6.7), (3, "Tom", 7.6)]

getNome :: (Int, String, Float) -> String
getNome (a,b,c) = b

getPrimeiroAluno :: [(Int, String, Float)] -> (Int, String, Float)
getPrimeiroAluno (a:_) = a

gerarPares :: [(Int, String, Float)] -> [(Int, String, Float)] -> [((Int, String, Float), (Int, String, Float))] 
gerarPares l1 l2 = [(a,b) | a <- l1, b <- l2, a < b]

main = do
    print (gerarPares alunos alunos)

