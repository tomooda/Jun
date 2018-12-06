instance creation
parallelProjectionEyePoint: a3dPoint1 sightPoint: a3dPoint2 upVector: a3dPoint3 height: aNumber1 near: aNumber2 far: aNumber3
	^ self defaultParallelProjectionClass
		eyePoint: a3dPoint1
		sightPoint: a3dPoint2
		upVector: a3dPoint3
		height: aNumber1
		near: aNumber2
		far: aNumber3