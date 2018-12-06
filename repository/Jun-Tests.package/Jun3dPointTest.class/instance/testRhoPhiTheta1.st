tests
testRhoPhiTheta1
	| p rho phi theta |
	p := 1 _ , -2 _ , 3.
	rho := p rho.
	phi := p phi.
	theta := p theta.
	self assert: ((Jun3dPoint rho: rho phi: phi theta: theta) equal: p)