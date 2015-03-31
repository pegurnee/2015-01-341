module Assist_Lib
( tail'
, head'
, init'
, last'
, store
, pack
, isSquare
, isVowel
, isConsonant
, someNumbers
, someLetters
, trimListOfKey
, scatter
, gather
) where

import           System.Random

tail' :: [a] -> [a]
tail' [] = []
tail' (_:theList) = theList

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
someLetters = randomRs ('a', 'z' ) (mkStdGen 1) :: [Char]
someNumbers = randomRs (-100, 100) (mkStdGen 1) :: [Int]

store :: [a] -> [(a, Bool)]
store [] = []
store theData = zip theData deleteMap

pack :: [(a, Bool)] -> [(a, Bool)]
pack dataBlocks = [ validData
      | validData <- dataBlocks,
        not $ snd validData]

isSquare :: (Integral a) => a -> Bool
isSquare num = num == (^2) (floor $ sqrt $ fromIntegral num)

isVowel :: Char -> Bool
isVowel c = elem c ['a', 'e', 'i', 'o', 'u']

isConsonant :: Char -> Bool
isConsonant c = not $ isVowel c

trimListOfKey :: (Eq a) => a -> [(a, b)] -> [(a, b)]
trimListOfKey key = filter (\x -> fst x /= key)

scatter :: (Integral a) => a -> [b] -> [(a, [b])]
scatter numberOfCores sharableData =
      combine possibleCores $ distributedData numberOfCores sharableData
  where
    possibleCores = [0..numberOfCores-1]
    distributedData numberOfCores = zip (cycle possibleCores)

combine [] _ = []
combine (coreNum:remainingCores) [] = (coreNum, []) : combine remainingCores []
combine (coreNum:remainingCores) all@(x:xs) =
      grabAllData coreNum all :
            combine remainingCores (removeExtraData coreNum xs)

grabAllData key theData = (key, [snd tuple | tuple <- theData, fst tuple == key])
removeExtraData key = filter (\x -> fst x /= key)

gather :: (Num a) => [(a, [b])] -> (a, [b])
gather allDistributedData = (numCores, recombineData allDistributedData)
  where
    numCores = fst (last allDistributedData) + 1
    recombineData [] = []
    recombineData (first:allTheRest) = snd first ++ recombineData allTheRest
