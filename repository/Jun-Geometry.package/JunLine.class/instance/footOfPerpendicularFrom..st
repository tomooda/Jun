functions
footOfPerpendicularFrom: aPoint
	"Array 
		with: ((0 , 0 , 0 to: 1 , 1 , 1) footOfPerpendicularFrom: -1 , 1 , 0)
		with: ((0 , 0 to: 1 , 1) footOfPerpendicularFrom: -1 , 1)."

	^ self nearestPointFromPoint: aPoint