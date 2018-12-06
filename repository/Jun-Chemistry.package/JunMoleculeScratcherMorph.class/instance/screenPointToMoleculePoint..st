geometry
screenPointToMoleculePoint: aPoint
	^ ((aPoint - self bounds center) / (scale @ scale negated)) asJun3dPoint