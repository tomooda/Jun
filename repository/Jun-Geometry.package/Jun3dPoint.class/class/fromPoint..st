instance creation
fromPoint: aPoint
	^ self
		x: aPoint x
		y: aPoint y
		z:
			((aPoint respondsTo: #z)
				ifTrue: [ aPoint z ]
				ifFalse: [ 0.0 ])