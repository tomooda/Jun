typical transformation
translate: aPoint
	"Jun3dTransformation translate: 10, 20, 30."

	| thePoint aTransformation |
	thePoint := Jun3dPoint coerce: aPoint.
	aTransformation := self unity.
	aTransformation setL: thePoint x.
	aTransformation setM: thePoint y.
	aTransformation setN: thePoint z.
	^ aTransformation