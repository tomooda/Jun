projecting
perspectiveProjection: aJunPerspectiveProjection
	| depth xyScale |
	self setProjection: aJunPerspectiveProjection copy.
	depth := aJunPerspectiveProjection sightPoint distance: aJunPerspectiveProjection eyePoint.
	xyScale := 2.0 / aJunPerspectiveProjection regularHeight.
	projectionTransformation := ((Jun3dTransformation
		fromOrigin: aJunPerspectiveProjection sightPoint
		xAxis: aJunPerspectiveProjection unitRightVector
		yAxis: aJunPerspectiveProjection unitUpVector
		zAxis: aJunPerspectiveProjection unitSightVector negated) product: (Jun3dTransformation perspective: 0 _, 0 , depth))
		product: (Jun3dTransformation scale: xyScale _, xyScale , -1).
	projectionTransformation := projectionTransformation product: (Jun3dTransformation translate: 0 _, 0 , depth).
	totalTransformation := nil.
	projection := aJunPerspectiveProjection copy