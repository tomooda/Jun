viewing
createDraggerFor: aPoint
	^ Jun3dModelDragger new
		projection: self projection;
		origin: aPoint;
		yourself