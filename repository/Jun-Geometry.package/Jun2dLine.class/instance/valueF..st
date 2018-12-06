functions
valueF: aPoint
	"((-2 , -2) to: (0 , 2)) valueF: (0 , 0)."

	| thePoint |
	thePoint := self pointClass coerce: aPoint.
	^ self a * thePoint x + (self b * thePoint y) + self c