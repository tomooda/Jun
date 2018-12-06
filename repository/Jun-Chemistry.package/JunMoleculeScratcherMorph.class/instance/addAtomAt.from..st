operations
addAtomAt: aJun3dPoint from: aJunAtomOrNil
	| atom |
	atom := self atomAt: aJun3dPoint ifAbsent: [ atomBuffer add: (self defaultAtomClass at: aJun3dPoint asJun3dPoint) ].
	aJunAtomOrNil ifNotNil: [ self ensureBondBetween: aJunAtomOrNil and: atom ].
	self changed.
	^ atom