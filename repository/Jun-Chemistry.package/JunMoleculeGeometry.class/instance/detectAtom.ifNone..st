enumerating
detectAtom: aBlock ifNone: errorBlock
	self
		atomsDo: [ :atom | 
			(aBlock value: atom)
				ifTrue: [ ^ atom ] ].
	^ errorBlock value