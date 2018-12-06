computing
autoBondsByCovalentRadiiWithTolerance: aNumber
	| b |
	b := OrderedCollection new.
	1 to: self size - 1 do: [ :i1 | 
		| atom1 radius1 |
		atom1 := self at: i1.
		radius1 := atom1 covalentRadius.
		i1 + 1 to: self size do: [ :i2 | 
			| atom2 radius2 |
			atom2 := self at: i2.
			radius2 := atom2 covalentRadius.
			radius1 + radius2 + aNumber > (atom1 position distance: atom2 position)
				ifTrue: [ b add: (JunBond between: atom1 and: atom2) ] ] ].
	bonds := b