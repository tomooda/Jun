comparing
equal: anAngle
	self class == anAngle class
		ifFalse: [ ^ false ].
	^ (self rad - anAngle rad) abs < self accuracy