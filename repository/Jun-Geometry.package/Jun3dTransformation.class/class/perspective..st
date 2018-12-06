typical transformation
perspective: aPoint
	"Jun3dTransformation perspective: (Jun3dPoint fromArray: #(100 100 100))."

	| thePoint aTransformation |
	thePoint := Jun3dPoint coerce: aPoint.
	aTransformation := self unity.
	aTransformation setA: thePoint z negated.
	aTransformation setE: thePoint z negated.
	aTransformation setG: thePoint x.
	aTransformation setH: thePoint y.
	aTransformation setI: -1.
	aTransformation setR: 1.
	aTransformation setS: thePoint z negated.
	^ aTransformation