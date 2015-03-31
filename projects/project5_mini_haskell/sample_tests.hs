import           Haskell_Mini_Project

testAll = ((testPrefix1 == testPrefix2) == (testPrefix3
          == testReduce1)) == ((testReduce2
          == testScatter1) == testScatter2)

testPrefix1 = (prefix (+) [2, 4, 1, 1]) == [2,6,7,8]
testPrefix2 = (prefix (+) [0, 2, -3, 4, -5]) == [0,2,-1,3,-2]
testPrefix3 = (prefix max [2, 3, 1, 1]) == [2,3,3,3]
testReduce1 = (reduce (max) 3 [ 4, 2, 5, 1]) == 5
testReduce2 = (reduce (+) 3 [ 4, 2, 5, 1]) == 15
testScatter1 = (scatter 3 [1, 2, 3, 4, 5, 6, 7]) == [(0,[1,4,7]),(1,[2,5]),(2,[3,6])]
testScatter2 = (scatter 5 ["ab", "2", "def", "4"]) == [(0,["ab"]),(1,["2"]),(2,["def"]),(3,["4"]),(4,[])]
testGather1 = gather [ (0, [True, True] ), (1, [True, False] ), (2, [False, True]) ]
testGather2 = gather [ (0, [1, 4, 7] ), (1, [2, 5] ), (2, [3, 6] ) ]
