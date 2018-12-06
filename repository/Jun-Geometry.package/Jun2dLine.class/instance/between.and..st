private
between: aPoint1 and: aPoint2
	| point1 point2 dx dy denominator |
	point1 := Jun2dPoint coerce: aPoint1.
	point2 := Jun2dPoint coerce: aPoint2.
	point1 = point2
		ifTrue: [ ^ self error: 'can not define a line' ].
	dx := point2 x - point1 x.
	dy := point2 y - point1 y.
	denominator := dx squared + dy squared.
	denominator < self class accuracy
		ifTrue: [ ^ self error: 'can not define a line' ].
	denominator := denominator sqrt.
	self setX0: (point1 x + point2 x) / 2.0.
	self setY0: (point1 y + point2 y) / 2.0.
	self setF: dy negated / denominator.
	self setG: dx / denominator