functions
polyline: firstPoint with: secondPoint with: thirdPoint
	^ self polylineClass
		vertexes:
			(Array
				with: self
				with: firstPoint
				with: secondPoint
				with: thirdPoint)