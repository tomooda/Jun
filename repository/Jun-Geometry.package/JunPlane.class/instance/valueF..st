functions
valueF: aPoint
	"((-2 , -2 , 0) plane: (0 , 2 , 0) and: (2 , 0 , 0)) valueF: (0 , 0 , 2)."

	| thePoint |
	thePoint := self pointClass coerce: aPoint.
	^ self a * thePoint x + (self b * thePoint y) + (self c * thePoint z) + self d