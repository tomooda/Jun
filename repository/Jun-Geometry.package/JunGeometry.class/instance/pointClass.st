class access
pointClass
	self is3d ifTrue: [^Jun3dPoint].
	self is2d ifTrue: [^Jun2dPoint].
	^self subclassResponsibility