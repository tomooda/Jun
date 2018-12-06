instance creation
parallelProjectionEyePoint: eyePoint sightPoint: sightPoint upVector: upVector height: height
	| distance |
	distance := sightPoint distance: eyePoint.
	^ self
		parallelProjectionEyePoint: eyePoint
		sightPoint: sightPoint
		upVector: upVector
		height: height
		near: distance / 10.0
		far: distance * 10.0