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

count'' item [] = 0
count'' item (x:xs)
  | item == x = 1 + count'' item xs
  | otherwise = count'' item xs

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
      | otherwise = subHelp (curIndex + 1) (x:xs) ys

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
permute [] = [[]]
permute xs = [x:ys | x <- xs, ys <- permute (trimmedList x xs)]
  where trimmedList target (t:trimmed) =
                  if target == t
                    then trimmed
                    else t : trimmedList target trimmed

-- 6 --
ackermann m n
  | m == 0 = n + 1
  | m > 0 && n == 0 = ackermann (m - 1) 1
  | m > 0 && n > 0 = ackermann (m - 1) (ackermann m (n - 1))
  | otherwise = error "must have positive values"

ackermann' m n p
  | p == 0 = m + n
  | n == 0 && p == 1 = 0
  | n == 0 && p == 2 = 1
  | n == 0 = m
  | otherwise = ackermann' m (ackermann' m (n - 1) p) (p - 1)




