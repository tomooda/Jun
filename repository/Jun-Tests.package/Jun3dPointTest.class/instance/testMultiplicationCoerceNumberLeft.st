tests
testMultiplicationCoerceNumberLeft
	"coerce a number"

	| p a |
	p := 1 _ , -2 _ , 3.
	a := -4.
	self assert: a * p equals: (Jun3dPoint x: p x * a y: p y * a z: p z * a)