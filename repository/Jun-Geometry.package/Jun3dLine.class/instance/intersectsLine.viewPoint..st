functions
intersectsLine: aLine viewPoint: aPoint
	"(50 , 50 , -50 to: -50 , -50 , -50) 
		intersectsLine: (-50 , 50 , 50 to: 50 , -50 , 50) 
		viewPoint: 0 , 0 , 100."

	^ (self intersectingPointsLine: aLine viewPoint: aPoint) isEmpty not