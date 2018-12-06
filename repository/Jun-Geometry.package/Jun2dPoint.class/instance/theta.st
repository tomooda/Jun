polar coordinates
theta
	| theta |
	x isZero
		ifTrue: [ 
			y isZero
				ifTrue: [ ^ JunAngle zero ].
			y >= 0
				ifTrue: [ ^ 0.5 * JunAngle pi ]
				ifFalse: [ ^ 1.5 * JunAngle pi ] ].
	theta := JunAngle fromRad: (y / x) arcTan.
	x >= 0
		ifTrue: [ 
			y >= 0
				ifTrue: [ ^ theta ]
				ifFalse: [ ^ 2.0 * JunAngle pi + theta ] ]
		ifFalse: [ ^ 1.0 * JunAngle pi + theta ]