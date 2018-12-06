converting
asEyeTransformation
	| scale |
	scale := self height abs / 2.
	^ Jun3dTransformation
		fromOrigin: self sightPoint
		xAxis: self unitRightVector * scale
		yAxis: self unitUpVector * scale
		zAxis: self unitSightVector * scale