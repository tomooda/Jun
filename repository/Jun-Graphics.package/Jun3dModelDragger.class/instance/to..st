accessing
to: aPoint
	| center fromPoint toPoint rotationAngle rotationAxis transformation upPoint |
	center := projection sightPoint.
	fromPoint := self grab3dPoint: origin.
	toPoint := self grab3dPoint: aPoint.
	rotationAngle := (Jun3dLine from: center to: toPoint) angleWithLine: (Jun3dLine from: center to: fromPoint).
	rotationAngle rad abs > self thetaAccuracy
		ifFalse: [ ^ self ].
	rotationAxis := Jun3dLine from: center to: center - (fromPoint - center product: toPoint - center).
	transformation := Jun3dTransformation rotate: rotationAngle around: rotationAxis.
	upPoint := projection sightPoint + projection unitUpVector.
	projection eyePoint: (transformation applyTo: projection eyePoint).
	projection upVector: ((transformation applyTo: upPoint) - projection sightPoint) unitVector.
	origin := aPoint