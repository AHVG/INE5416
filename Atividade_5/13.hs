apagarEnquanto :: (t -> Bool) -> [t] -> [t]
apagarEnquanto _ [] = []
apagarEnquanto f (x:resto) | (f x == False) = x : resto
apagarEnquanto f (x:resto) = apagarEnquanto f resto

main = do
    print (apagarEnquanto (\x -> x > 10) [13,12,11,20,21,1,2,3,4,5,10,11,300])

