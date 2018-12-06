sweeping
sweepAround: aJun3dLine
	"(Jun3dLine from: 0, 1, 0 to: 1, 1, 0) sweepAround: (Jun3dLine from: 0, 0, 0 to: 1, 0, 0)"

	^ self asNurbsCurve sweepAround: aJun3dLine