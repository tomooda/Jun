transforming
transform: aTransformation
	^ self class
		on: (self p1 transform: aTransformation)
		on: (self p2 transform: aTransformation)
		on: (self p3 transform: aTransformation)