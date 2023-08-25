mdc :: Int -> Int -> Int
mdc a b | (b == 0) = a
mdc a b | otherwise = mdc b (a `mod` b)

mmc :: Int -> Int -> Int
mmc x y = div (x * y) (mdc x y)

ehDivisivel :: Int -> Int -> Bool
ehDivisivel x y | (mmc x y == x) = True
ehDivisivel x y | otherwise = False

ehPrimo :: Int -> Int -> Bool
ehPrimo n i | (i == 1) = True
ehPrimo n i | otherwise = (not (ehDivisivel n i) && (ehPrimo n (i - 1)))

ehPrimoInterface :: Int -> Bool
ehPrimoInterface n | (n == 1 || n == 2) = True
ehPrimoInterface n | (n < 1) = False
ehPrimoInterface n | otherwise = ehPrimo n (n - 1)

conjectura :: Int -> Int -> (Int, Int)
conjectura n i | (ehPrimoInterface (n - i)) = (i, n - i)
conjectura n i | otherwise = conjectura n (i + 1)

conjecturaInterface :: Int -> (Int, Int)
conjecturaInterface n | (n <= 2) = (0, 0)
conjecturaInterface n | otherwise = conjectura n 1

main :: IO()
main = do

    n <- readLn :: IO Int

    print (conjecturaInterface n)