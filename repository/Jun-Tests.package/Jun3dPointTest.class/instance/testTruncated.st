tests
testTruncated
	"truncate of all components"

	| x y z |
	x := 1.1.
	y := -2.1.
	z := 3.7.
	self
		assert: (x _ , y _ , z) truncated
		equals: x truncated _ , y truncated _ , z truncated