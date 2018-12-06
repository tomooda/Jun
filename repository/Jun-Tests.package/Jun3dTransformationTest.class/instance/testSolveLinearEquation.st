tests
testSolveLinearEquation
	"2x - 3y + 4z -5 = 0
	 -5x + 6y -7z + 8 = 0
	 8x - 9y - z + 1 = 0
	=> x=1, y=2"
	| equations x y z |
	equations := Array with: (Array with: 2.0 with: -3.0 with: 4.0 with: -5.0) with: (Array with: -5.0 with: 6.0 with: -7.0 with: 8.0) with: (Array with: 8.0 with: -9.0 with: -1.0 with: 1.0).
	Jun2dTransformation solveLinearEquations: equations.
	x := equations first last negated.
	y := equations second last negated.
	z := equations third last negated.
	self assert: 2.0 * x + (-3.0 * y) + (4.0*z) - 5.0 equals: 0.
	self assert: -5.0 * x + (6.0 * y) + (-7.0*z) + 8.0 equals: 0.
	self assert: 8.0 * x + (-9.0 * y) + (-1.0*z) + 1.0 equals: 0