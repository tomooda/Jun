testing
contains: aBoundingBox
	^ aBoundingBox origin >= self origin and: [ aBoundingBox corner <= self corner ]