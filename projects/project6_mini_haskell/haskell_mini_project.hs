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
count = 4

-- 2 --
substring = 4

-- 3 --
get_last = 4

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

