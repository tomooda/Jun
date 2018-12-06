tests
testAs2dPoint
	"as is"

	| x y  p |
	x := 2.
	y := -3.
	p := x _, y.
	self assert: p as2dPoint equals: x _, y