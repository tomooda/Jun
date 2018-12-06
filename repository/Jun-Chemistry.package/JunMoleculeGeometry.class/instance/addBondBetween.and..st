adding/removing
addBondBetween: aJunAtom1 and: aJunAtom2
	| atom1 atom2 |
	atom1 := aJunAtom1 isInteger
		ifTrue: [ self at: aJunAtom1 ]
		ifFalse: [ aJunAtom1 ].
	atom2 := aJunAtom2 isInteger
		ifTrue: [ self at: aJunAtom2 ]
		ifFalse: [ aJunAtom2 ].
	(self includesAtom: atom1)
		ifFalse: [ ^ nil ].
	(self includesAtom: atom2)
		ifFalse: [ ^ nil ].
	^ bonds add: (JunBond between: atom1 and: atom2)