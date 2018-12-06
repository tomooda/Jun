operations
changeAtom: aJunAtom
	JunPeriodicTableMorph chooseAnAtomClass
		ifNotNil: [ :newAtomClass | 
			| newAtom numBonds |
			newAtom := newAtomClass at: aJunAtom position.
			moleculeGeometry replaceAtom: aJunAtom with: newAtom.
			numBonds := 0.
			moleculeGeometry neighborsOf: newAtom do: [ :atom | numBonds := numBonds + 1 ].
			numBonds = 1
				ifTrue: [ self adjustAtom: newAtom ]
				ifFalse: [ self changed ] ]