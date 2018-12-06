testing
containsPoint: aPoint
	"(JunPlane on: (-2 , -2 , 0) on: (0 , 2 , 0) on: (2 , 0 , 0)) 
	containsPoint: (0 , 0 , 1)."

	^ (self valueF: aPoint) abs < self class accuracy