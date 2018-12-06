operations
removeAtom: aJunAtom
	moleculeGeometry removeAtom: aJunAtom ifAbsent: [  ].
	self changed