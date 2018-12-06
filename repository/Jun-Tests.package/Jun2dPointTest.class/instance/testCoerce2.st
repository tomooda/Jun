tests
testCoerce2
	"coerce a number"

	| p |
	p := -4 @ 5.
	self assert: (Jun2dPoint coerce: p) equals: -4 _, 5