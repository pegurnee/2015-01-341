doubleMe x = x + x
doubleUs x y = doubleMe x + doubleMe y
doubleSmallNumber x = if x > 100 
	then x 
	else x + x
doubleSmallNumber' x = (if x > 100 
	then x 
	else x + x) + 1
conanO'Brien = "It's a-me Conan O'Brien!"
boombBangs xs = [if x < 10 
	then "BOOM!" 
	else "BANG!" | x <- xs, odd x]
lengthBetter xs = sum [1 | _ <- xs]
sumUpLeading n = sum [1..n]
factorial n = product [1..n]
