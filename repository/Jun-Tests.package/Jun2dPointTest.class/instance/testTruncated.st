tests
testTruncated
	"truncate of all components"

	| x y |
	x := 1.1.
	y := -2.1.
	self assert: (x _, y) truncated equals: x truncated _, y truncated