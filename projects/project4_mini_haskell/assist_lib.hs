module Assist_Lib
( store
, head'
, init'
, last'
, points
) where

import           System.Random

head' :: [a] -> a
head' (theHead:_) = theHead

init' :: [a] -> [a]
init' [] = []
init' [x] = []
init' (x:y:xs) = x : init' (y:xs)

last' :: [a] -> a
last' [x] = x
last' (_:x:xs) = last' (x:xs)

deleteMap = randoms (mkStdGen 1) :: [Bool]

store :: [a] -> [(a, Bool)]
store [] = []
store theData = zip theData deleteMap

points = [(4, 3), (1, 6), (2, 4)]
