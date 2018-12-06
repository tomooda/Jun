comparing
= aBoundingBox
	^ self class == aBoundingBox class
		and: [ self origin = aBoundingBox origin and: [ self corner = aBoundingBox corner ] ]