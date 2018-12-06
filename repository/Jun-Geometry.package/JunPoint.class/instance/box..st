functions
box: aPoint 
	^ self boundingBoxClass origin: (self min: aPoint) corner: (self max: aPoint)