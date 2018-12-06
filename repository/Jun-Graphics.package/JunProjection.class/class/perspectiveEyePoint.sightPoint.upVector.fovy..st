instance creation
perspectiveEyePoint: eyePoint sightPoint: sightPoint upVector: upVector fovy: aJunAngle
	| distance |
	distance := sightPoint distance: eyePoint.
	^ self
		perspectiveEyePoint: eyePoint
		sightPoint: sightPoint
		upVector: upVector
		fovy: aJunAngle
		near: distance / 10.0
		far: distance * 10.0