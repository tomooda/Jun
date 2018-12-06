transforming
transform: aJunTransformation
	| molecule |
	molecule := self class new.
	self atomsDo: [ :atom | molecule add: (atom transform: aJunTransformation) ].
	self
		bondsDo: [ :bond | 
			| index1 index2 newBond |
			index1 := atoms indexOf: bond atom1.
			index2 := atoms indexOf: bond atom2.
			newBond := bond copy.
			newBond setAtom1: (molecule at: index1) atom2: (molecule at: index2) ].
	^ molecule