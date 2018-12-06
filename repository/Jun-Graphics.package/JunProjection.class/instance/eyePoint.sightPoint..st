accessing
eyePoint: aJun3dPoint1 sightPoint: aJun3dPoint2
	(aJun3dPoint1 equal: aJun3dPoint2)
		ifTrue: [ ^ nil ].
	self setEyePoint: aJun3dPoint1 sightPoint: aJun3dPoint2