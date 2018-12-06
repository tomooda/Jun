functions
intersectingPointWithLine: aJun3dLine
	"(0 , 0 , 0 to: 1.5 , 0 , 0) intersectingPointWithLine: (1 , 1 , -1 to: 1 , -1 , -1)."

	| yourF yourG yourH denominatorXY denominatorYZ denominatorZX yourX0 yourY0 yourZ0 t yourT x y z yourX yourY yourZ |
	yourF := aJun3dLine f.
	yourG := aJun3dLine g.
	yourH := aJun3dLine h.
	yourX0 := aJun3dLine x0.
	yourY0 := aJun3dLine y0.
	yourZ0 := aJun3dLine z0.
	denominatorXY := yourF * g - (f * yourG).
	denominatorYZ := yourG * h - (g * yourH).
	denominatorZX := yourH * f - (h * yourF).
	((denominatorXY abs max: denominatorYZ abs) max: denominatorZX abs) < self class accuracy
		ifTrue: [ 
			"parallel"
			^ nil ].
	(denominatorXY abs >= denominatorYZ abs and: [ denominatorXY abs >= denominatorZX abs ])
		ifTrue: [ 
			t := (yourF * (yourY0 - y0) - (yourG * (yourX0 - x0))) / denominatorXY.
			yourF abs > yourG abs
				ifTrue: [ yourT := (f * t + x0 - yourX0) / yourF ]
				ifFalse: [ yourT := (g * t + y0 - yourY0) / yourG ] ]
		ifFalse: [ 
			denominatorYZ abs >= denominatorZX abs
				ifTrue: [ 
					t := (yourG * (yourZ0 - z0) - (yourH * (yourY0 - y0))) / denominatorYZ.
					yourG abs > yourH abs
						ifTrue: [ yourT := (g * t + y0 - yourY0) / yourG ]
						ifFalse: [ yourT := (h * t + z0 - yourZ0) / yourH ] ]
				ifFalse: [ 
					t := (yourH * (yourX0 - x0) - (yourF * (yourZ0 - z0))) / denominatorZX.
					yourH abs > yourF abs
						ifTrue: [ yourT := (h * t + z0 - yourZ0) / yourH ]
						ifFalse: [ yourT := (f * t + x0 - yourX0) / yourF ] ] ].
	x := f * t + x0.
	y := g * t + y0.
	z := h * t + z0.
	yourX := yourF * yourT + yourX0.
	yourY := yourG * yourT + yourY0.
	yourZ := yourH * yourT + yourZ0.
	((x - yourX) abs > self class accuracy
		or: [ (y - yourY) abs > self class accuracy or: [ (z - yourZ) abs > self class accuracy ] ])
		ifTrue: [ ^ nil ].
	^ Jun3dPoint x: x y: y z: z