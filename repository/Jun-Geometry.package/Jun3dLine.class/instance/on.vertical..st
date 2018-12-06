private
on: aPoint vertical: aPlane
	| fromPoint toPoint |
	fromPoint := self pointClass coerce: aPoint.
	toPoint := aPlane footOfPerpendicularFrom: fromPoint.
	self from: fromPoint to: toPoint