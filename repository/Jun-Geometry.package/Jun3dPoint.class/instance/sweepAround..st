sweeping
sweepAround: aJun3dLine 
	^ self notYetImplemented "| center radius normalVector |
	center := aJun3dLine nearestPointFromPoint: self.
	radius := self distance: center.
	normalVector := aJun3dLine asUnitVector.
	^JunNurbsCurve
		circleCenter: center
		normalVector: normalVector
		radius: radius"