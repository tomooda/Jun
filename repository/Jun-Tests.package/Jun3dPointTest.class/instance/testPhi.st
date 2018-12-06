tests
testPhi
	| rho phi theta |
	rho := 2.
	phi := Float pi / 2.0.
	theta := 10 asDegrees.
	self assert: (Jun3dPoint rho: rho phi: phi theta: theta) phi equals: phi asRadians