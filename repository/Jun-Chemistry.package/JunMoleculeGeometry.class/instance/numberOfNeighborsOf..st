accessing
numberOfNeighborsOf: aJunAtom
	| num |
	num := 0.
	self neighborsOf: aJunAtom do: [ :atom | num := num + 1 ].
	^ num