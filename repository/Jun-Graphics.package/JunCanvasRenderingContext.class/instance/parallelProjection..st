projecting
parallelProjection: aJunParallelProjection
	| scale |
	self setProjection: aJunParallelProjection copy.
	scale := aJunParallelProjection height / 2.0.
	projectionTransformation := Jun3dTransformation
		fromOrigin: aJunParallelProjection eyePoint
		xAxis: aJunParallelProjection unitRightVector * scale
		yAxis: aJunParallelProjection unitUpVector * scale
		zAxis: aJunParallelProjection unitSightVector.
	totalTransformation := nil.
	projection := aJunParallelProjection