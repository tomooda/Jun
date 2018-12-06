functions
merge: boundingBox
	^ self class origin: (self origin min: boundingBox origin) corner: (self corner max: boundingBox corner)