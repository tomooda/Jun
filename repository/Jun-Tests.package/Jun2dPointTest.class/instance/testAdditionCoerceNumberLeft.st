tests
testAdditionCoerceNumberLeft
	"coerce a number"

	| p a |
	p := 1 _, -2.
	a := -4.
	self assert: a + p equals: (Jun2dPoint x: p x + a y: p y + a)