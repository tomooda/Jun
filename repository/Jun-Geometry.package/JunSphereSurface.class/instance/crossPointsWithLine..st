functions
crossPointsWithLine: aJun3dLine
	| nearestPointOnLine distance shift shiftVector |
	nearestPointOnLine := aJun3dLine nearestPointFromPoint: self center.
	distance := self center distance: nearestPointOnLine.
	distance > self radius
		ifTrue: [ ^ Array new ].
	(distance - self radius) abs < self class accuracy
		ifTrue: [ ^ Array with: nearestPointOnLine ].
	shift := (radius * radius - (distance * distance)) sqrt.
	shiftVector := (aJun3dLine to - aJun3dLine from) unitVector * shift.
	^ Array with: nearestPointOnLine + shiftVector with: nearestPointOnLine - shiftVector