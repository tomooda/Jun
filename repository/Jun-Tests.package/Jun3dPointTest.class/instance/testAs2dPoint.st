tests
testAs2dPoint
	"drops z component"

	| x y z p |
	x := 2.
	y := -3.
	z := 4.
	p := x _, y _, z.
	self assert: p as2dPoint equals: x _, y