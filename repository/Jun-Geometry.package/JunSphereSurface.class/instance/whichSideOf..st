testing
whichSideOf: bisector
	| sign |
	sign := self center whichSideOf: bisector.
	sign = 0
		ifTrue: [ ^ 0 ].
	(bisector distanceFromPoint: self center) <= self radius
		ifTrue: [ ^ 0 ].
	^ sign