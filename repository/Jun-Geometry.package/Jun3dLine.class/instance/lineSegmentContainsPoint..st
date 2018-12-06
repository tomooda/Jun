testing
lineSegmentContainsPoint: aPoint
	| thePoint |
	thePoint := Jun3dPoint coerce: aPoint.
	^ (self lineSegmentDistanceFromPoint: thePoint) < self class accuracy