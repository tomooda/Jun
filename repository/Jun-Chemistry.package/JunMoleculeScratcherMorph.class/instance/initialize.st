initialize-release
initialize
	super initialize.
	moleculeGeometry := RMapMolecule new.
	scale := 40.
	currentAtom := nil.
	atomBuffer := OrderedCollection new.
	bondBuffer := OrderedCollection new.
	startPoint := nil.
	self extent: 500 @ 500.
	self color: Color white