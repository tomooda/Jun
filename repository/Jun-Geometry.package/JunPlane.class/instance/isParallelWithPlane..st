functions
isParallelWithPlane: aPlane
	"(0 _, 0 , 0 plane: 0 _, 1 , 0 and: 0 _, 0 , 1) 
		isParallelWithPlane: (1 _, 0 , 0 plane: 1 _, 1 , 0 and: 1 _, 0 , 1)."

	^ (Jun3dLine from: Jun3dPoint zero to: self normalVector)
		isParallelWithLine: (Jun3dLine from: Jun3dPoint zero to: aPlane normalVector)