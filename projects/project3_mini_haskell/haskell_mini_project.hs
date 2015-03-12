-- 2.a --
createSquaredList [] = [0]
createSquaredList theList = [x^2 | x <- theList]

-- 2.b --
createSquareRootList :: (Integral a) => [a] -> [a] 
createSquareRootList theList = [truncate (sqrt (fromIntegral n)) | n <- theList, isSquare n]
isSquare :: (Integral a) => a -> Bool
isSquare num = (floor (sqrt (fromIntegral num))) ^ 2 == num

-- 2.c --
getVowelFreeString theString = [c | c <- theString, not $ isVowel c]
isVowel c = c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u'
isConsonant c = not $ isVowel c

-- 2.d --
--generateTwoSixSidedDiceThatValueSeven = [[dieOne, dieTwo] | dieOne <- [1..6], dieTwo <- [1..6], dieOne + dieTwo == 7]
generateTwoSixSidedDiceThatValue num = [[dieOne, dieTwo] | dieOne <- [1..6], dieTwo <- [1..6], dieOne + dieTwo == num]
--generateDiceOptions 2 6 7
--generateDiceOptions numDice numSide targetNumber = []

-- 2.e --


