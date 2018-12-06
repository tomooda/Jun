comparing
equal: aPlane
	self class == aPlane class
		ifFalse: [ ^ false ].
	^ (((self a - aPlane a) abs < self accuracy and: [ (self b - aPlane b) abs < self accuracy ])
		and: [ (self c - aPlane c) abs < self accuracy ]) and: [ (self d - aPlane d) abs < self accuracy ]