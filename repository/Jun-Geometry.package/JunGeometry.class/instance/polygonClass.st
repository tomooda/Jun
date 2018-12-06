class access
polygonClass
	^ self notYetImplemented "self is3d ifTrue: [^Jun3dPolygon].
	self is2d ifTrue: [^Jun2dPolygon].
	^self subclassResponsibility"