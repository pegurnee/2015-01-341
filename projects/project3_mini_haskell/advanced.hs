--generateTwoSixSidedDiceThatValueSeven = [[dieOne, dieTwo] | dieOne <- [1..6], dieTwo <- [1..6], dieOne + dieTwo == 7]
generateTwoSixSidedDiceThatValueSeven = generateTwoDiceOfThatValue 6 7
generateTwoSixSidedDiceThatValue num = generateTwoDiceOfThatValue 6 num
--[[dieOne, dieTwo] | dieOne <- [1..6], dieTwo <- [1..6], dieOne + dieTwo == num]
generateTwoDiceOfThatValue sides num = [[dieOne, dieTwo] | dieOne <- [1..sides], dieTwo <- [1..sides], dieOne + dieTwo == num]
generateDiceOfThatValue numDice sides targetNum = [[dieOne, dieTwo] | dieOne <- [1..sides], dieTwo <- [1..sides], dieOne + dieTwo == targetNum]
--getDieValue side = die | die <- [1..sides]

--fun numDice sides targetNum = [possibleDice numDice sides | roll <- die, die <- (possibleDice numDice sides), (sum (possibleDice numDice sides)) == targetNum]
possibleDice 0 _ = []
possibleDice 1 sides = [1..sides]
possibleDice numDice sides = [1..sides] ++ (possibleDice (numDice - 1) sides)
--possibleDice (die:theDice) sides = [
--foo numDice sides targetNum = [ | roll <- die <- dice numDice sides, sum 
bax = 1 : [] : 4 : [] : [] : 4 : 5 : []


--generateDiceOptions 2 6 7
--generateDiceOptions numDice numSide targetNumber = []


