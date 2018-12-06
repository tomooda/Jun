functions
center: aPoint
	| thePoint |
	thePoint := self class coerce: aPoint.
	^ self + ((thePoint - self) / 2)