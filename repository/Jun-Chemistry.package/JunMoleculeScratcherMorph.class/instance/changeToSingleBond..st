operations
changeToSingleBond: aJunBond
	aJunBond order: 1.
	(moleculeGeometry numberOfNeighborsOf: aJunBond atom1) = 1
		ifTrue: [ ^ self adjustAtom: aJunBond atom1 ].
	(moleculeGeometry numberOfNeighborsOf: aJunBond atom2) = 1
		ifTrue: [ ^ self adjustAtom: aJunBond atom2 ].
	self changed