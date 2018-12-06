functions
lineSegmentDistanceFromPoint: aPoint
	"(0 , 0 to: 1 , 1) lineSegmentDistanceFromPoint: -1 , -1."

	| thePoint pointOnMe |
	thePoint := Jun2dPoint coerce: aPoint.
	pointOnMe := self lineSegmentNearestPointFromPoint: thePoint.
	^ thePoint distance: pointOnMe