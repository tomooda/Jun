private
intersectingTWithLine: aJun3dLine
	"(Jun3dLine from: 0, 0, 0 to: 1.5, 0, 0) intersectingTWithLine: (Jun3dLine from: 1, 1, -1 to: 1, -1, -1)"

	| yourF yourG yourH denominatorXY denominatorYZ denominatorZX yourX0 yourY0 yourZ0 |
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
	^ (denominatorXY abs >= denominatorYZ abs and: [ denominatorXY abs >= denominatorZX abs ])
		ifTrue: [ 
			| t |
			t := (yourF * (yourY0 - y0) - (yourG * (yourX0 - x0))) / denominatorXY.
			((yourF * h - (f * yourH)) * t + ((z0 - aJun3dLine z0) * yourF) - ((x0 - yourX0) * yourH)) abs < self class accuracy
				ifTrue: [ t ]
				ifFalse: [ nil ] ]
		ifFalse: [ 
			denominatorYZ abs >= denominatorZX abs
				ifTrue: [ 
					| t |
					t := (yourG * (yourZ0 - z0) - (yourH * (yourY0 - y0))) / denominatorYZ.
					((yourG * f - (g * yourF)) * t + ((x0 - yourX0) * yourG - ((y0 - yourY0) * yourF))) abs < self class accuracy
						ifTrue: [ t ]
						ifFalse: [ nil ] ]
				ifFalse: [ 
					| t |
					t := (yourH * (yourX0 - x0) - (yourF * (yourZ0 - z0))) / denominatorZX.
					((yourH * g - (h * yourG)) * t + ((y0 - yourY0) * yourH) - ((z0 - yourZ0) * yourG)) abs < self class accuracy
						ifTrue: [ t ]
						ifFalse: [ nil ] ] ]