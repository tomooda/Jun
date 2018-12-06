functions
polyline: firstPoint with: secondPoint
	^ self polylineClass vertexes: (Array with: self with: firstPoint with: secondPoint)