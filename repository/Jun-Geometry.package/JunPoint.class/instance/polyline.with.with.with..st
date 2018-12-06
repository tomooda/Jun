functions
polyline: firstPoint with: secondPoint with: thirdPoint with: forthPoint
	^ self polylineClass
		vertexes:
			(Array with: self)
				,
					(Array
						with: firstPoint
						with: secondPoint
						with: thirdPoint
						with: forthPoint)