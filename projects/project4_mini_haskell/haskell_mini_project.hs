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
tail' = []

-- 2 --
sum' = []

-- 3 --
distance = []

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
 