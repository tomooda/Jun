testing
includesBondBetween: aJunAtomOrInteger1 and: aJunAtomOrInteger2
	self bondBetween: aJunAtomOrInteger1 and: aJunAtomOrInteger2 ifAbsent: [ ^ false ].
	^ true