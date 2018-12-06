adding/removing
addBond: aJunBond
	(self includesAtom: aJunBond atom1)
		ifFalse: [ ^ nil ].
	(self includesAtom: aJunBond atom2)
		ifFalse: [ ^ nil ].
	^ bonds
		add:
			aJunBond