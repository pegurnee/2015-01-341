module Sample_Tests
( testAll
) where

import           Haskell_Mini_Project

testAll = test1 && test2 && test3
          && test4 && test5 && test6

test1 = (count 2 [2,3,2,1,2,5]) == 3
test2 = (substring [2,3,4] [0,1,2,3,4,3,4]) == 2
test3 = (substring [1,7] [0,1,2,3,1,7,6]) == 4
test4 = (get_last [1,2,3,5]) == 5
test5 = (zip_pairs [(1,2),(3,4),(5,6)] [(100,101),(200,201)]) ==  [(1,2,100,101),(3,4,200,201)]
test6 = (permute [1,2,3]) == [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
