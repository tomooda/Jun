testing
lineSegmentStrictlyContainsPoint: aJun2dPoint
	^ (self containsPoint: aJun2dPoint)
		and: [ 
			| t |
			t := self tAtPoint: aJun2dPoint.
			t between: self class accuracy and: 1 - self class accuracy ]