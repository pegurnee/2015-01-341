factorial :: (Integral a) => a -> a
factorial n = case n of 0 -> 1
                        n -> n * factorial (n - 1)
lengthBetter :: (Num a) => [t] -> a
lengthBetter [] = 0
lengthBetter (_:xs) = 1 + lengthBetter xs
sumUpLeading :: (Num a) => [a] -> a
sumUpLeading [] = 0
sumUpLeading (x:xs) = x + sumUpLeading xs
capital :: String -> String
capital "" = "Empty String"
capital all@(x:xs) = "The first letter of "
    ++ all
    ++ " is "
    ++ [x]
bmiCalc :: (RealFloat a) => a -> a -> String
bmiCalc weight height
    | bmi <= skinny = "You're underweight, you emo, you!"
    | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"
    | bmi <= fat    = "You're fat! Lose some weight, fatty!"
    | otherwise = "You're a whale, congratulations!"
    where   bmi = weight / height ^ 2
            (skinny, normal, fat) = (18.5, 25.0, 30.0)
maxer :: (Ord a) => a -> a -> a
maxer a b
    | a > b = a
    | otherwise = b
myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
    | a > b     = GT
    | a == b    = EQ
    | otherwise = LT
initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
    where   (f:_) = firstname
            (l:_) = lastname
calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2]
    --where bmi weight height = weight / height ^ 2
cylinder :: (RealFloat a) => a -> a -> a
cylinder r h =
    let sideArea = 2 * pi * r * h
        topArea = pi * r ^ 2
    in  sideArea + 2 * topArea
describeList :: [a] -> String
describeList xs = "The list is " ++ what xs
    where what [] = "empty."
          what [x] = "a singleton list."
          what xs = "a longer list."
