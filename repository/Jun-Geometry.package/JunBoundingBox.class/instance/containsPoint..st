testing
containsPoint: aPoint
	| thePoint |
	thePoint := self pointClass coerce: aPoint.
	^ self origin <= thePoint and: [ thePoint < self corner ]