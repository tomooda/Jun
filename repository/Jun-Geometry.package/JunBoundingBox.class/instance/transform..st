transforming
transform: aTransformation
	^ self class origin: (self origin transform: aTransformation) corner: (self corner transform: aTransformation)