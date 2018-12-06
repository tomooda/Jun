event handling
handleMouseStillDown: aMouseEvent
	self stopSteppingSelector: #handleMouseStillDown:.
	(moleculeGeometry includesAtom: currentAtom)
		ifTrue: [ 
			(JunMoleculeScratcherMenuMorph on: self origin: startPoint arg: currentAtom)
				addAt: 0 @ -20 + startPoint label: 'delete' selector: #removeAtom:;
				addAt: -50 @ 20 + startPoint label: 'change' selector: #changeAtom:;
				addAt: 50 @ 20 + startPoint label: 'adjust' selector: #adjustAtom:;
				handleMouseDown: aMouseEvent ]
		ifFalse: [ 
			(self bondAt: (self screenPointToMoleculePoint: aMouseEvent position) ifAbsent: [  ])
				ifNotNil: [ :bond | 
					(JunMoleculeScratcherMenuMorph on: self origin: startPoint arg: bond)
						addAt: 0 @ -20 + startPoint label: 'delete' selector: #removeBond:;
						addAt: -100 @ 20 + startPoint label: 'single' selector: #changeToSingleBond:;
						addAt: 0 @ 20 + startPoint label: 'double' selector: #changeToDoubleBond:;
						addAt: 100 @ 20 + startPoint label: 'triple' selector: #changeToTripleBond:;
						handleMouseDown: aMouseEvent ] ].
	self clearStroke.
	self changed