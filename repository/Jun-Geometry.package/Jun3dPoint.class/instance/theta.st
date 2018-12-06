polar coordinates
theta
	| wk theta |
	wk := (x * x + (y * y)) sqrt.
	z isZero
		ifTrue: 
			[wk isZero ifTrue: [^JunAngle zero].
			^0.5 * JunAngle pi].
	theta := JunAngle fromRad: (wk asFloat / z asFloat) arcTan.
	z >= 0
		ifTrue: [^theta]
		ifFalse: [^1.0 * JunAngle pi + theta]