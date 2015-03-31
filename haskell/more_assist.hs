splitish :: [a] -> ([a], [a])
splitish = foldr (\x (ys, zs) -> (x : zs, ys)) ([], [])

splits = foldr (\x (ys, zs) -> (x : zs, ys)) ([], [])

splito [] = ([], [])
splito [x] = ([x], [])
splito (x:y:xys) = (x:xs, y:ys) where (xs, ys) = splito xys

scats [] = []
scats (x:xs) = [x] : scats xs

groupNth n [] = []
groupNth n xs = take n $ [ y | y <- everyNth xs ] : groupNth n (tail xs)
        where
        everyNth [] = []
        everyNth l@(y:ys) = y : everyNth (drop n l)

splitEvery :: Int -> [a] -> [[a]]
splitEvery _ [] = []
splitEvery n xs = bs : splitEvery n cs
  where (bs,cs) = splitAt n xs

every n xs = case drop (n-1) xs of
            (y:ys) -> y : every n ys
            [] -> []

remove_every_nth :: Int -> [a] -> [a]
remove_every_nth n = foldr step [] . zip [1..]
    where step (i,x) acc = if (i `mod` n) == 0 then acc else x:acc

remove_every_nth' :: Int -> [a] -> [a]
remove_every_nth' = recur 1
    where recur _ _ []     = []
          recur i n (x:xs) = if i == n
            then recur 1 n xs
            else x:recur (i+1) n xs

