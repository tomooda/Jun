adding/removing
removeBond: aJunBond ifAbsent: errorBlock
	^ bonds remove: aJunBond ifAbsent: errorBlock