comparing
<= anAngle
	(anAngle isKindOf: self class)
		ifTrue: [ ^ rad <= anAngle rad ].
	^ self retry: #<= coercing: anAngle