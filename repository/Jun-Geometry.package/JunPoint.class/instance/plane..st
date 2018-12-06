functions
plane: normalVector
	"Array 
		with: ((0 , 0 , 0) plane: (1 , 0 , 0)) 
		with: ((0 , 0) plane: (1 , 0))."

	^ self planeClass on: self normalVector: normalVector