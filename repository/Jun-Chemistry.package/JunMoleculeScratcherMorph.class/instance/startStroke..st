event handling
startStroke: aMouseEvent
	startPoint := aMouseEvent position.
	currentAtom := self atomAt: (self screenPointToMoleculePoint: startPoint) ifAbsent: [  ].
	currentAtom ifNil: [ currentAtom := self addAtomAt: (self screenPointToMoleculePoint: startPoint) from: nil ].
	self changed