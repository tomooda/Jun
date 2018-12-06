enumerating
neighborsOf: aJunAtomOrInteger do: aBlock
	(aJunAtomOrInteger isInteger
		ifTrue: [ atoms at: aJunAtomOrInteger ifAbsent: [  ] ]
		ifFalse: [ aJunAtomOrInteger ])
		ifNotNil: [ :atom | 
			self
				bondsDo: [ :bond | 
					bond atom1 == atom
						ifTrue: [ aBlock value: bond atom2 ].
					bond atom2 == atom
						ifTrue: [ aBlock value: bond atom1 ] ] ]