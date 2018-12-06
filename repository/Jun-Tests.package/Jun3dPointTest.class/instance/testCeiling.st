tests
testCeiling
	"celing of all components"

	| x y z |
	x := 1.1.
	y := -2.1.
	z := 3.7.
	self assert: (x _, y _, z) ceiling equals: x ceiling _, y ceiling _, z ceiling