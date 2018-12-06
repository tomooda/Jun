tests
testDotProduct1
	"dot product of 90 degrees corssing is zero"

	| r1 r2 theta1 theta2 p1 p2 |
	r1 := 2.0.
	r2 := 3.0.
	theta1 := 40 asDegrees.
	theta2 := 40 asDegrees + 90 asDegrees.
	p1 := Jun2dPoint rho: r1 theta: theta1.
	p2 := Jun2dPoint rho: r2  theta: theta2.
	self assert: (p1 dotProduct: p2) abs equals: 0