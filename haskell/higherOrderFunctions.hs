multThree :: (Num a) => a -> a -> a -> a
multThree x y z = x * y * z
compareWithHundred :: (Ord a, Num a) => a -> Ordering
compareWithHundred x = compare 100 x
compareWithHundredBetter :: (Ord a, Num a) => a -> Ordering
compareWithHundredBetter = compare 100
divideByTen :: (Floating a) => a -> a
divideByTen = (/10)
isUpperAlphaNum :: Char -> Bool
isUpperAlphaNum = (`elem` ['A'..'Z'])