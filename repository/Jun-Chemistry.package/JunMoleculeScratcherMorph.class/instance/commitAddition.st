operations
commitAddition
	atomBuffer do: [ :atom | moleculeGeometry addAtom: atom ].
	bondBuffer do: [ :bond | moleculeGeometry addBond: bond ]