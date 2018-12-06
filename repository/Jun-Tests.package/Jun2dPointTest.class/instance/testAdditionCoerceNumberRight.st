tests
testAdditionCoerceNumberRight
	"coerce a number"

	| p a |
	p := 1 _, -2.
	a := -4.
	self assert: p + a equals: (Jun2dPoint x: p x + a y: p y + a)