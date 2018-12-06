event handling
continueStroke: aMouseEvent
	| p  moleculePoint |
	p := aMouseEvent position.
	moleculePoint := self screenPointToMoleculePoint: p.
	atomBuffer removeAll.
	bondBuffer removeAll.
	self atomAt: moleculePoint ifAbsent: [ moleculePoint := self gridify: moleculePoint from: currentAtom ].
	self stopSteppingSelector: #handleMouseStillDown:.
	(moleculeGeometry includesAtom: currentAtom)
		ifFalse: [ atomBuffer add: currentAtom ].
	self addAtomAt: moleculePoint from: currentAtom.
	self changed