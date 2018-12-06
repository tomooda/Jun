functions
distanceFromPoint: aPoint
	"Array 
		with: ((0 , 0 , 0 to: 1 , 1 , 1) distanceFromPoint: -1 , 1 , 0)
		with: ((0 , 0 to: 1 , 1) distanceFromPoint: -1 , 1)."

	| thePoint pointOnMe |
	thePoint := self pointClass coerce: aPoint.
	pointOnMe := self footOfPerpendicularFrom: thePoint.
	^ thePoint distance: pointOnMe