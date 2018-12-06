class access
transformationClass
	self is3d
		ifTrue: [ ^ Jun3dTransformation ].
	self is2d
		ifTrue: [ ^ Jun2dTransformation ].
	^ self subclassResponsibility