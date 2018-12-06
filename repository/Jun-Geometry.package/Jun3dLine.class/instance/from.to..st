private
from: fromPoint to: toPoint
	| point1 point2 |
	point1 := Jun3dPoint coerce: fromPoint.
	point2 := Jun3dPoint coerce: toPoint.
	self setX0: point1 x.
	self setY0: point1 y.
	self setZ0: point1 z.
	self setF: point2 x - point1 x.
	self setG: point2 y - point1 y.
	self setH: point2 z - point1 z