data Forma = Circulo Float | Retangulo Float Float | Triangulo Float Float

area :: Forma -> Float
area (Circulo r) = pi * r * r
area (Retangulo b a) = b * a
area (Triangulo b a) = b * a / 2.0

meuTriangulo :: Forma
meuTriangulo = (Triangulo 10 10)

meuRetangulo :: Forma
meuRetangulo = (Retangulo 4 6)

meuCirculo :: Forma
meuCirculo = (Circulo 10)

main = do 
    putStrLn ( show (area meuTriangulo) )
    putStrLn ( show (area meuRetangulo) )
    putStrLn ( show (area meuCirculo) )
