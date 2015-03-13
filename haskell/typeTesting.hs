removeLowercase :: [Char] -> [Char]
removeLowercase st = [c | c <- st, elem c ['A'..'Z']]
removeUppercase :: [Char] -> [Char]
removeUppercase st = [c | c <- st, elem c ['a'..'z']]
makeEnumeratedType :: (Num a, Enum a) => [t] -> [(a, t)]
makeEnumeratedType xs = zip [1..] xs
addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z
factorial :: Integer -> Integer
factorial n = product [1..n]
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)
first (x, _, _) = x
second (_, y, _) = y
third (_, _, z) = z
letRightTriangles x =
        [(a,b,c) | a <- [1..x],
                                b <- [1..x],
                                c <- [1..x],
                                a^2 + b^2 == c^2]
