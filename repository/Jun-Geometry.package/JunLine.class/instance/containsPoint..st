testing
containsPoint: aPoint
	| thePoint |
	thePoint := self pointClass coerce: aPoint.
	^ (self distanceFromPoint: thePoint) < self class accuracy