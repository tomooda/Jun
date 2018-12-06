private
setEyePoint: aJun3dPoint1 sightPoint: aJun3dPoint2 upVector: aJun3dPoint3 fovy: aJunAngle near: aNumber1 far: aNumber2
	| angle |
	(aJunAngle isKindOf: JunAngle)
		ifTrue: [ angle := aJunAngle ]
		ifFalse: [ angle := JunAngle fromDeg: aJunAngle ].
	eyePoint := aJun3dPoint1.
	sightPoint := aJun3dPoint2.
	upVector := aJun3dPoint3.
	fovy := angle.
	near := aNumber1.
	far := aNumber2.
	self normalizeUpVector