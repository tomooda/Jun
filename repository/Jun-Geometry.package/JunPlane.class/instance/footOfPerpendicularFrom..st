functions
footOfPerpendicularFrom: aPoint
	| fromPoint toPoint aLine |
	fromPoint := self pointClass coerce: aPoint.
	toPoint := fromPoint + self normalUnitVector.
	aLine := Jun3dLine from: aPoint to: toPoint.
	^ self intersectingPointWithLine: aLine