class access
polylineClass
	^ self notYetImplemented "self is3d ifTrue: [^Jun3dPolyline].
	self is2d ifTrue: [^Jun2dPolyline].
	^self subclassResponsibility"