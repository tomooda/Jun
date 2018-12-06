tests
testAs3dPoint
	"add z: 0"

	| x y p |
	x := 2.
	y := -3.
	p := x _, y.
	self assert: p as3dPoint equals: x _, y _, 0