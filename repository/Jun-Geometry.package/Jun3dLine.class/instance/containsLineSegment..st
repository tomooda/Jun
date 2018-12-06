testing
containsLineSegment: aJun3dLine
	^ (self lineSegmentContainsPoint: aJun3dLine from) and: [ self lineSegmentContainsPoint: aJun3dLine to ]