operations
ensureBondBetween: aJunAtom1 and: aJunAtom2
	((moleculeGeometry includesBondBetween: aJunAtom1 and: aJunAtom2)
		or: [ 
			bondBuffer
				contains: [ :bond | 
					(bond atom1 == aJunAtom1 and: [ bond atom2 == aJunAtom2 ])
						or: [ bond atom1 == aJunAtom2 and: [ bond atom2 == aJunAtom1 ] ] ] ])
		ifFalse: [ bondBuffer add: (JunBond between: aJunAtom1 and: aJunAtom2) ]