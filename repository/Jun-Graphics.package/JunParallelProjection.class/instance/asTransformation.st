converting
asTransformation
	"origin at the eyepoint and the depth is normalized by the distance between eyepoint and sightpoint.
	the sightpoint will be transformed into 0, 0, 1"
	| scale |
	scale := self height abs / 2.
	^ Jun3dTransformation
		fromOrigin: self eyePoint
		xAxis: self unitRightVector * scale
		yAxis: self unitUpVector * scale
		zAxis: self sightPoint - self eyePoint