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
scatter = 4

-- 4 --
--gather ::
gather = 4
