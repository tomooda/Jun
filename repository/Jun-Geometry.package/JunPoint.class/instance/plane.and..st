functions
plane: aPoint1 and: aPoint2
	"Array 
		with: ((0 , 0 , 0) plane: (1 , 0 , 0) and: (1 , 1 , 1)) 
		with: ((0 , 0) plane: (1 , 0) and: (1 , 1))."

	^ self planeClass on: self on: aPoint1 on: aPoint2