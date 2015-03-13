module Assist_Lib
( store
, sampleData
, sampleMap
, points

) where

sampleData = ['a'..'r']
sampleMap = [True, False, False]
store theData deleteMap = [(dataItem, deleteKey) 
      | x <- [1..15], 
        dataItem <- theData !! (x `mod` (length theData)), 
        deleteKey <- deleteMap !! (x `mod` (length deleteMap))]
points = [(4, 3), (1, 6), (2, 4)]