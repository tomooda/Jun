private
from: fromPoint to: toPoint
	| point1 point2 |
	point1 := Jun2dPoint coerce: fromPoint.
	point2 := Jun2dPoint coerce: toPoint.
	self setX0: point1 x.
	self setY0: point1 y.
	self setF: point2 x - point1 x.
	self setG: point2 y - point1 y