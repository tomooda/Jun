tests
testCeiling
	"celing of all components"

	| x y  |
	x := 1.1.
	y := -2.1.
	self assert: (x _, y) ceiling equals: x ceiling _, y ceiling