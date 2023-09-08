data Ponto = P2D Float Float | P3D Float Float Float

distancia :: Ponto -> Ponto -> Float
distancia (P2D x1 y1) (P2D x2 y2) = sqrt ((x1-x2)^2 + (y1-y2)^2)
distancia (P3D x1 y1 z1) (P3D x2 y2 z2) = sqrt ((x1-x2)^2 + (y1-y2)^2 + (z1-z2)^2)


main = do
    print (distancia (P2D 10 10) (P2D 0 0))
    print (distancia (P3D 10 10 10) (P3D 0 0 0))


