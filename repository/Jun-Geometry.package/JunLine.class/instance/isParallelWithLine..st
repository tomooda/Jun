testing
isParallelWithLine: aLine
	"(0 , 0 to: 1 , 1) isParallelWithLine: (0 , 2 to: 1 , 3)."
	"(0 , 0 , 0 to: 1 , 1 , 0) isParallelWithLine: (0 , 2 , 0 to: 1 , 3 , 0)."

	| degrees |
	degrees := (self angleWithLine: aLine) deg.
	^ (0.0 - degrees) abs < self class accuracy or: [ (180.0 - degrees) abs < self class accuracy ]