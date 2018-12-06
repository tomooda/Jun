converting
asBoundingBall
	^ self notYetImplemented "| centerPoint aRadius |
	centerPoint := self center.
	aRadius := centerPoint distance: self to.
	^self boundingBallClass center: self center radius: aRadius"