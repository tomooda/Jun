tests
testDistanceFromLine
	| line1 line2 |
	line1 := -1 _ , -2 _ , 0 to: 1 _ , 2 _ , 0.
	line2 := 3 _ , -4 _ , 1 to: -3 _ , 4 _ , 1.
	self assert: (line1 distanceFromLine: line2) equals: 1