adding/removing
addAll: aCollectionOfJunMoleculeGeometry
	aCollectionOfJunMoleculeGeometry do: [ :molecule | moleculeGeometries add: molecule ].
	^ aCollectionOfJunMoleculeGeometry