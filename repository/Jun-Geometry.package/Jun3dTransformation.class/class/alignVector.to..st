typical transformation
alignVector: aJun3dPoint1 to: aJun3dPoint2
	| zero axisVector normalVector1 normalVector2 |
	(aJun3dPoint1 - aJun3dPoint2) length < aJun3dPoint2 accuracy
		ifTrue: [ ^ self unity ].
	zero := Jun3dPoint zero.
	axisVector := (aJun3dPoint1 vectorProduct: aJun3dPoint2) unitVector.
	normalVector1 := aJun3dPoint1 vectorProduct: axisVector.
	normalVector2 := aJun3dPoint2 vectorProduct: axisVector.
	^ self
		alignPoints:
			(Array
				with: aJun3dPoint1 -> aJun3dPoint2
				with: axisVector -> axisVector
				with: normalVector1 -> normalVector2
				with: zero -> zero)