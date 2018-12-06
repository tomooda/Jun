operations
addAtomAt: aJun3dPoint
	| atom |
	atom := self addAtomAt: aJun3dPoint from: nil.
	self changed.
	^ atom