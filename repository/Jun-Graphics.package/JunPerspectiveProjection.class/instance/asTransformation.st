accessing
asTransformation
	| depth height xyScale |
	depth := self sightPoint distance: self eyePoint.
	height := self regularHeight.
	xyScale := height / depth / 2.0.
	^ ((Jun3dTransformation
		fromOrigin: self sightPoint
		xAxis: self unitRightVector
		yAxis: self unitUpVector
		zAxis: self unitSightVector negated) product: (Jun3dTransformation perspective: 0 _, 0 , depth))
		product: (Jun3dTransformation scale: xyScale , xyScale , depth reciprocal negated)