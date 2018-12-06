class access
boundingBallClass
	^ self notYetImplemented "self is3d ifTrue: [^Jun3dBoundingBall].
	self is2d ifTrue: [^Jun2dBoundingBall].
	^self subclassResponsibility"