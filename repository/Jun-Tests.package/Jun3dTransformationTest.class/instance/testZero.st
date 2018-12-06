tests
testZero
	"zero transformation transforms any point to zero"

	| zero |
	zero := Jun3dTransformation zero.
	self assert: (0 _ , 0 _ , 0 transform: zero) equals: 0 _ , 0 _ , 0.
	self assert: (1 _ , 0 _ , 0 transform: zero) equals: 0 _ , 0 _ , 0.
	self assert: (0 _ , 1 _ , 0 transform: zero) equals: 0 _ , 0 _ , 0.
	self assert: (0 _ , 0 _ , 1 transform: zero) equals: 0 _ , 0 _ , 0.
	self assert: (1 _ , 1 _ , 1 transform: zero) equals: 0 _ , 0 _ , 0