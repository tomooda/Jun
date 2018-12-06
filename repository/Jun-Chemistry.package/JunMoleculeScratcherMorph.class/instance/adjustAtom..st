operations
adjustAtom: aJunAtom
	10
		timesRepeat: [ 
			| delta |
			delta := Jun3dPoint zero.
			moleculeGeometry
				bondsDo: [ :bond | 
					(bond atom1 == aJunAtom or: [ bond atom2 == aJunAtom ])
						ifTrue: [ 
							| peer |
							peer := bond peerOf: aJunAtom.
							delta := (aJunAtom position - peer position
								length:
									(aJunAtom covalentRadiusOfOrder: bond order) + (peer covalentRadiusOfOrder: bond order)
										- (aJunAtom position distance: peer position)) + delta ] ].
			aJunAtom position: aJunAtom position + delta ].
	self changed