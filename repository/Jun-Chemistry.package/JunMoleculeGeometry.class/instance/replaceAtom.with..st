adding/removing
replaceAtom: aJunAtom1 with: aJunAtom2
	| index |
	index := atoms indexOf: aJunAtom1.
	^ index > 0
		ifTrue: [ 
			self at: index put: aJunAtom2.
			bonds
				do: [ :bond | 
					bond atom1 == aJunAtom1
						ifTrue: [ bond atom1: aJunAtom2 ].
					bond atom2 == aJunAtom1
						ifTrue: [ bond atom2: aJunAtom2 ] ] ]
		ifFalse: [ nil ]