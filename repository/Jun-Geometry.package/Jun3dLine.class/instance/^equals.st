comparing
= aLine
	self class == aLine class
		ifFalse: [ ^ false ].
	^ ((((x0 = aLine x0 and: [ y0 = aLine y0 ]) and: [ z0 = aLine z0 ]) and: [ f = aLine f ]) and: [ g = aLine g ])
		and: [ h = aLine h ]