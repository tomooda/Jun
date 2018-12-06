functions
angleBetween: aJun2dPoint1 and: aJun2dPoint2
	| v1 v2 r1 r2 |
	v1 := aJun2dPoint1 - self.
	v2 := aJun2dPoint2 - self.
	r1 := v1 r.
	r2 := v2 r.
	(r1 < self class accuracy or: [ r2 < self class accuracy ])
		ifTrue: [ ^ JunAngle zero ]
		ifFalse: [ 
			| sin |
			sin := ((self y asFloat + aJun2dPoint1 y asFloat) * (self x asFloat - aJun2dPoint1 x asFloat)
				+ ((aJun2dPoint1 y asFloat + aJun2dPoint2 y asFloat) * (aJun2dPoint1 x asFloat - aJun2dPoint2 x asFloat))
				+ ((aJun2dPoint2 y asFloat + self y asFloat) * (aJun2dPoint2 x asFloat - self x asFloat))) / 2 * 2.0 / r1 / r2.
			sin := (sin max: -1.0) min: 1.0.
			^ (v1 dotProduct: v2) >= 0.0
				ifTrue: [ JunAngle fromRad: sin arcSin ]
				ifFalse: [ 
					sin abs < self class accuracy
						ifTrue: [ JunAngle pi ]
						ifFalse: [ ((Float pi - sin arcSin abs) * sin sign) asRadians ] ] ]