module Haskell_Mini_Project
( count
, substring
, get_last
, zip_pairs
, permute
, ackermann
) where

import           Assist_Lib

-- 1 --
count item = counter 0
  where
    counter curr [] = curr
    counter curr (x:xs)
      | item == x = counter (curr + 1) xs
      | not (elem item xs) = curr
      | otherwise = counter curr xs

count' item = length . filter (== item)

-- 2 --
substring xs ys = subHelp 0 xs ys

subHelp curIndex (x:xs) (y:ys)
  | x == y = checkMore xs ys
  | not (elem x ys) = -1
  | otherwise = subHelp (curIndex + 1) (x:xs) ys
  where
    checkMore [] _ = curIndex
    checkMore (ix:ixs) (iy:iys)
      | ix == iy = checkMore ixs iys
      | not (elem ix iys) = -1
      | otherwise = checkMore ixs iys

-- 3 --
get_last [] = error "empty list"
get_last [x] = x
get_last (_:x:xs) = get_last (x:xs)

-- 4 --
zip_pairs [] _ = []
zip_pairs _ [] = []
zip_pairs (x:xs) (y:ys) = mergeTuples x y : zip_pairs xs ys
  where
    mergeTuples (x1, x2) (y1, y2) = (x1, x2, y1, y2)


-- 5 --
premute [] = []
permute (x:xs) = [x | x <- xs] : premute xs

-- 6 --
ackermann = 4



