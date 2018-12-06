tests
testDotProduct3
	"dot product is | v1 | | v2 | cos theta"

	| r1 r2 phi theta1 theta2 p1 p2 |
	r1 := 2.0.
	r2 := 3.0.
	phi := 30 asDegrees.
	theta1 := 40 asDegrees.
	theta2 := 40 asDegrees + 60 asDegrees.
	p1 := Jun3dPoint rho: r1 phi: phi theta: theta1.
	p2 := Jun3dPoint rho: r2 phi: phi theta: theta2.
	self assert: (p1 dotProduct: p2) equals: r1 * r2 / 2