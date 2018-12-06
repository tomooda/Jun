functions
intersect: boundingBox
	^ self class origin: (self origin max: boundingBox origin) corner: (self corner min: boundingBox corner)