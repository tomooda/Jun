adding/removing
removeAtom: aJunAtom ifAbsent: errorBlock
	atoms remove: aJunAtom ifAbsent: [ ^ errorBlock value ].
	bonds removeAllSuchThat: [ :bond | bond atom1 == aJunAtom or: [ bond atom2 == aJunAtom ] ].
	^ aJunAtom