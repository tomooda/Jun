defaults
defaultProjection
	^ JunPerspectiveProjection
		eyePoint: 10 _ , 10 _ , 10
		sightPoint: 0 _ , 0 _ , 0
		upVector: 0 _ , 0 _ , 1
		fovy: 30 asDegrees
		near: -100.0
		far: 100.0