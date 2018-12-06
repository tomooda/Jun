tests
testEquals1
	"equality permits errors within accuracy"

	| p1 delta |
	p1 := 2 _, -3.
	delta := (p1 accuracy negated _, p1 accuracy ) / 10.
	self assert: (p1 + delta equal: p1)