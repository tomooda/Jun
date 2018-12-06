typical transformation
scale: aPoint
	"Jun3dTransformation scale: (Jun3dPoint fromArray: #(1 2 3))."

	| thePoint aTransformation |
	thePoint := Jun3dPoint coerce: aPoint.
	aTransformation := self unity.
	aTransformation setA: thePoint x.
	aTransformation setE: thePoint y.
	aTransformation setI: thePoint z.
	^ aTransformation