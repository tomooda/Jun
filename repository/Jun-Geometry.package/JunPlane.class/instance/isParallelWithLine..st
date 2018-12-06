functions
isParallelWithLine: aLine
	"(0 _, 0 , 0 plane: 0 _, 1 , 0 and: 0 _, 0 , 1) 
		isParallelWithLine: (1 _, 2 , 0 to: 1 _, 1 , 1)."

	^ ((Jun3dLine from: Jun3dPoint zero to: self normalVector)
		angleWithLine: aLine) deg abs < self class accuracy