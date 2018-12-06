testing
isEmpty
	self is3d
		ifTrue: [ ^ self volume < self class accuracy ].
	self is2d
		ifTrue: [ ^ self area < self class accuracy ].
	^ false