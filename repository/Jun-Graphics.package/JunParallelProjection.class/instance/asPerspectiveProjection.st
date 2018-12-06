converting
asPerspectiveProjection
	| fovy |
	fovy := JunAngle fromRad: (self height / 2.0 / self distance) arcTan * 2.
	^ self class
		perspectiveEyePoint: self eyePoint
		sightPoint: self sightPoint
		upVector: self upVector
		fovy: fovy
		near: self near
		far: self far