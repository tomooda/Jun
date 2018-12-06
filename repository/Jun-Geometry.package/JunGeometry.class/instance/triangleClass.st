class access
triangleClass
	^ self notYetImplemented "self is3d ifTrue: [^Jun3dTriangle].
	self is2d ifTrue: [^Jun2dTriangle].
	^self subclassResponsibility"