instance creation
perspectiveEyePoint: eyePoint sightPoint: sightPoint upVector: upVector fovy: aJunAngle near: near far: far
	^ self defaultPerspectiveClass
		eyePoint: eyePoint
		sightPoint: sightPoint
		upVector: upVector
		fovy: aJunAngle
		near: near
		far: far