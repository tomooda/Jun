class access
circleClass
	^ self notYetImplemented "self is3d ifTrue: [^Jun3dCircle].
	self is2d ifTrue: [^Jun2dCircle].
	^self subclassResponsibility"