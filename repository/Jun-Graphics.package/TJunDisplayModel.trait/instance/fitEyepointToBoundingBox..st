operations
fitEyepointToBoundingBox: aJun3dBoundingBox
	self projection
		in: [ :projection | 
			projection
				eyePoint:
					(projection eyePoint - projection sightPoint) unitVector
						*
							((aJun3dBoundingBox width squared + aJun3dBoundingBox height squared
								+ aJun3dBoundingBox depth squared) sqrt * 3.0) + projection sightPoint.
			projection
				zoomHeight:
					(aJun3dBoundingBox width squared + aJun3dBoundingBox height squared
						+ aJun3dBoundingBox depth squared) sqrt.
			projection
				far:
					(aJun3dBoundingBox width squared + aJun3dBoundingBox height squared
						+ aJun3dBoundingBox depth squared) sqrt * 10.0.
			projection
				near:
					(aJun3dBoundingBox width squared + aJun3dBoundingBox height squared
						+ aJun3dBoundingBox depth squared) sqrt * -10.0 ]