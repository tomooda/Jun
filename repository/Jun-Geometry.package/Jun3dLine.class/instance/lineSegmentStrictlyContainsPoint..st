testing
lineSegmentStrictlyContainsPoint: aPoint
	^ (self lineSegmentContainsPoint: aPoint)
		and: [ (self from distance: aPoint) > self class accuracy and: [ (self to distance: aPoint) > self class accuracy ] ]