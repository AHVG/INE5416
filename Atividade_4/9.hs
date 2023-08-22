distancia :: Double -> Double -> Double -> Double -> Double -> Double -> Double
distancia x1 y1 z1 x2 y2 z2 = sqrt((x1 - x2)^2 + (y1 - y2)^2 + (z1 - z2)^2)

main :: IO()
main = do
    x1 <- readLn :: IO Double
    y1 <- readLn :: IO Double
    z1 <- readLn :: IO Double

    x2 <- readLn :: IO Double
    y2 <- readLn :: IO Double
    z2 <- readLn :: IO Double

    print (distancia x1 y1 z1 x2 y2 z2)