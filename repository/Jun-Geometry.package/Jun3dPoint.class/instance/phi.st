polar coordinates
phi
	| phi |
	x isZero
		ifTrue: [ 
			y isZero
				ifTrue: [ ^ JunAngle zero ].
			y >= 0
				ifTrue: [ ^ 0.5 * JunAngle pi ]
				ifFalse: [ ^ 1.5 * JunAngle pi ] ].
	phi := JunAngle fromRad: (y asFloat / x asFloat) arcTan.
	x >= 0
		ifTrue: [ 
			y >= 0
				ifTrue: [ ^ phi ]
				ifFalse: [ ^ 2.0 * JunAngle pi + phi ] ]
		ifFalse: [ ^ 1.0 * JunAngle pi + phi ]