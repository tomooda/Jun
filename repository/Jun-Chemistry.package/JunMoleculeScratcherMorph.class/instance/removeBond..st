operations
removeBond: aJunAtom
	moleculeGeometry removeBond: aJunAtom ifAbsent: [  ].
	self changed