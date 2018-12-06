testing
lineSegmentContainsPoint: aJun2dPoint
	^ (self containsPoint: aJun2dPoint)
		and: [ 
			| t |
			t := self tAtPoint: aJun2dPoint.
			t between: self class accuracy negated and: 1 + self class accuracy ]