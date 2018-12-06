comparing
equal: aLine
	self class == aLine class
		ifFalse: [ ^ false ].
	^ (((x0 - aLine x0) abs < self accuracy and: [ (y0 - aLine y0) abs < self accuracy ])
		and: [ (f - aLine f) abs < self accuracy ]) and: [ (g - aLine g) abs < self accuracy ]