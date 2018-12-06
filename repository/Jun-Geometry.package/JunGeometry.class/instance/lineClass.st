class access
lineClass
	self is3d
		ifTrue: [ ^ Jun3dLine ].
	self is2d
		ifTrue: [ ^ Jun2dLine ].
	^ self subclassResponsibility