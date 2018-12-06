tests
testTheta
	| rho  theta |
	rho := 2.
	theta := 10 asDegrees.
	self assert: (Jun2dPoint rho: rho theta: theta) theta equals: theta