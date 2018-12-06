class access
trianglesClass
	^ self notYetImplemented "self is3d ifTrue: [^Jun3dTriangles].
	self is2d ifTrue: [^Jun2dTriangles].
	^self subclassResponsibility"