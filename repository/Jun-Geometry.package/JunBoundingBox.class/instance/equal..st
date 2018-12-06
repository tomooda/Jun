comparing
equal: aBoundingBox
	^ self class = aBoundingBox class
		and: [ (self origin equal: aBoundingBox origin) and: [ self corner equal: aBoundingBox corner ] ]