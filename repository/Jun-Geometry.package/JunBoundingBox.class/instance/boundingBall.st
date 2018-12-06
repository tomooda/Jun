accessing
boundingBall
	| centerPoint |
	centerPoint := self center.
	^ self boundingBallClass center: centerPoint radius: (self origin distance: centerPoint)