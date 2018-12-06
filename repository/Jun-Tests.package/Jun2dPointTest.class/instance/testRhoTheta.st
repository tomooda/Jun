tests
testRhoTheta
	| p rho theta |
	p := 1 _, -2.
	rho := p rho.
	theta := p theta.
	self assert: ((Jun2dPoint rho: rho theta: theta) equal: p)