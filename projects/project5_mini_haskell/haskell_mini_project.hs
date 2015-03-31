module Haskell_Mini_Project
( prefix
, reduce
, scatter
, gather
) where

import           Assist_Lib

-- 1 --
prefix :: (a -> a -> a) -> [a] -> [a]
prefix = scanl1

-- 2 --
reduce :: (Num a) => (a -> a -> a) -> a -> [a] -> a
reduce func num xs = foldl1 (func) $ num : xs

-- 3 --
--scatter :: Integral -> [a] -> [(Integral, a)]
--scatter num (x:xs) =
scatter num xs = combine [0..num-1] $ groupish num xs
  where
    groupish num = zip (cycle [0..num-1])

{--
groupish num = zip' [0..num-1]
  where
    zip' [] [] = []
    zip' (x:xs) [] = (x, []) : zip' xs []
    zip' [] ys = zip (cycle [0..num-1]) ys
    zip' (x:xs) (y:ys) = (x, y) : zip' xs ys
    --}

combine [] _ = []
combine (p:pos) [] = (p, []) : combine pos []
combine (p:pos) all@(x:xs) = grab_all_data p all : combine pos (trim_list_of_key p xs)
  where
    grab_all_data num rest = (num, [snd item | item <- rest, fst item == num])

grab_all_with_key_as_tuple key list = (key, filter (\x -> fst x == key) list)
trim_list_of_key key = filter (\x -> fst x /= key)

{--
zip' [0..num-1] xs
  where
    zip' _ [] = []
    zip' [] ys = zip' [0..num-1] ys
    zip' (x:xs) (y:ys) = (x,y) : zip' xs ys
    --}



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


-- 4 --
--gather ::
gather = 4

