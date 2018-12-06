tests
testSolveLinearEquation
	"2x - 3y + 4 = 0
	 -5x + 6y -7 = 0
	=> x=1, y=2"
	| equations x y |
	equations := Array with: (Array with: 2.0 with: -3.0 with: 4.0) with: (Array with: -5.0 with: 6.0 with: -7.0).
	Jun2dTransformation solveLinearEquations: equations.
	x := equations first last negated.
	y := equations second last negated.
	self assert:  x equals: 1.0.
	self assert: y equals: 2.0.
	self assert: 2.0 * x + (-3.0 * y) + 4 equals: 0.
	self assert: -5.0 * x + (6.0 * y) - 7 equals: 0