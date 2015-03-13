maximumRec :: (Ord a) => [a] -> a
maximumRec [] = error "empty list"
maximumRec [x] = x
maximumRec (x:xs) = max x (maximumRec xs)
replicateRec :: (Num i, Ord i) => i -> a -> [a]
replicateRec n x
    | n <= 0 = []
    | otherwise = x:replicateRec (n - 1) x
takeRec :: (Num i, Ord i) => i -> [a] -> [a]
takeRec n _
    | n <= 0 = []
takeRec _ [] = []
takeRec n (x:xs) = x : takeRec (n - 1) xs
reverseRec :: [a] -> [a]
reverseRec [] = []
reverseRec (x:xs) = reverseRec xs ++ [x]
repeatRec :: a -> [a]
repeatRec x = x:repeatRec x
zipRec :: [a] -> [b] -> [(a,b)]
zipRec _ [] = []
zipRec [] _ = []
zipRec (x:xs) (y:ys) = (x,y):zipRec xs ys
elemRec :: (Eq a) => a -> [a] -> Bool
elemRec a [] = False
elemRec a (x:xs)
    | a == x = True
    | otherwise = elemRec a xs
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
    let smallSorted = quicksort [a | a <- xs, a <= x]
        largeSorted = quicksort [a | a <- xs, a > x]
    in  smallSorted ++ [x] ++ largeSorted
