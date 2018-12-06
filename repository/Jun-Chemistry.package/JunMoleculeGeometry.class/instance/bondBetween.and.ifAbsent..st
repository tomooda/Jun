accessing
bondBetween: aJunAtomOrInteger1 and: aJunAtomOrInteger2 ifAbsent: errorBlock
	(aJunAtomOrInteger1 isInteger
		ifTrue: [ atoms at: aJunAtomOrInteger1 ifAbsent: [ nil ] ]
		ifFalse: [ aJunAtomOrInteger1 ])
		ifNotNil: [ :atom1 | 
			(aJunAtomOrInteger2 isInteger
				ifTrue: [ atoms at: aJunAtomOrInteger2 ifAbsent: [ nil ] ]
				ifFalse: [ aJunAtomOrInteger2 ])
				ifNotNil: [ :atom2 | 
					self
						bondsDo: [ :bond | 
							(bond atom1 == atom1 and: [ bond atom2 == atom2 ])
								ifTrue: [ ^ bond ].
							(bond atom2 == atom1 and: [ bond atom1 == atom2 ])
								ifTrue: [ ^ bond ] ] ] ].
	^ errorBlock value