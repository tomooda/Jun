tests
testDotProduct2
	"dot product of opposite vectors is negative of product of lengths"

	| r1 r2 theta1 theta2 p1 p2 |
	r1 := 2.0.
	r2 := 3.0.
	theta1 := 40 asDegrees.
	theta2 := 40 asDegrees + 180 asDegrees.
	p1 := Jun2dPoint rho: r1 theta: theta1.
	p2 := Jun2dPoint rho: r2 theta: theta2.
	self assert: (p1 dotProduct: p2) equals: r1 * r2 negated