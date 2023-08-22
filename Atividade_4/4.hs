xor :: Bool -> Bool -> Bool
xor a b = (not a && b || a && not b)

main = do
    print (xor True False)