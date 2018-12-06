*Jun-Geometry-Basic
+ arg 
	"Answer a Point that is the sum of the receiver and arg."

	(arg isKindOf: self class) ifTrue: [^ (x + arg x) @ (y + arg y)].
	^ arg adaptToPoint: self andSend: #+