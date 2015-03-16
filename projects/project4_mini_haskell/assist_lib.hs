module Assist_Lib
( store
, sampleData
, sampleMap
, points

) where

sampleData = ['a'..'r']
sampleMap = [True, False, False]
store [] _ = []
store (d:theData) [True] = (d, False) : store theData [False]
store (d:theData) [False] = (d, True) : store theData [True]
store (d:theData) all@(m:deleteMap) = (d, m) : store theData deleteMap
points = [(4, 3), (1, 6), (2, 4)]
