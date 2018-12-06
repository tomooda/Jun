event handling
yellowButtonDown: aMouseEvent
	aMouseEvent wasHandled: true.
	(currentAtom := self atomAt: (self screenPointToMoleculePoint: aMouseEvent position) ifAbsent: [ nil ])
		ifNotNil: [ 
			(MenuMorph new
				add: 'delete'
					target: self
					selector: #removeAtom:
					argument: currentAtom;
				add: 'change...'
					target: self
					selector: #changeAtom:
					argument: currentAtom;
				add: 'adjust by covalent distance'
					target: self
					selector: #adjustAtom:
					argument: currentAtom;
				yourself) popUpEvent: aMouseEvent in: World.
			^ self ].
	(self bondAt: (self screenPointToMoleculePoint: aMouseEvent position) ifAbsent: [ nil ])
		ifNotNil: [ :bond | 
			(MenuMorph new
				add: 'delete'
					target: self
					selector: #removeBond:
					argument: bond;
				addLine;
				add: 'single'
					target: self
					selector: #changeToSingleBond:
					argument: bond;
				add: 'double'
					target: self
					selector: #changeToDoubleBond:
					argument: bond;
				add: 'triple'
					target: self
					selector: #changeToTripleBond:
					argument: bond;
				yourself) popUpEvent: aMouseEvent in: World.
			^ self ]