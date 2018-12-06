class access
boundingBoxClass
	self is3d
		ifTrue: [ ^ Jun3dBoundingBox ].
	self is2d
		ifTrue: [ ^ Jun2dBoundingBox ].
	^ self subclassResponsibility