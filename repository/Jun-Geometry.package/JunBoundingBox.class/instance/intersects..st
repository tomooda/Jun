testing
intersects: aBoundingBox
	^ self origin < aBoundingBox corner
		and: [ aBoundingBox origin < self corner and: [ self origin < self corner and: [ aBoundingBox origin < aBoundingBox corner ] ] ]