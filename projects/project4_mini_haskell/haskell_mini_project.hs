module Haskell_Mini_Project
( tail'
, sum'
, distance
, sum''
, reverse'
, pack
) where

import Assist_Lib

-- 1 --
tail' (l:theList) = theList

-- 2 --
sum' [] = 0
sum' (l:theList) = l + sum' theList

-- 3 --
distance (x1, y1) (x2, y2) = sqrt (fromIntegral((x1 - x2)^2 + (y1 - y2)^2))

-- 4 --
sum'' _ [] = []
sum'' [] _ = []
sum'' (f:firstList) (s:secondList) = (f + s) : (sum'' firstList secondList)

-- 5 --
reverse' [] = []
reverse' theList = (last theList) : (reverse' (init theList))

-- 6 --
pack dataBlocks = [ validData 
      | validData <- dataBlocks, 
        not $ snd validData]
 