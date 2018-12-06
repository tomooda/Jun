typical transformation
parallel: aPoint
	"Jun3dTransformation parallel: (Jun3dPoint fromArray: #(100 100 100))."

	| thePoint aTransformation |
	thePoint := Jun3dPoint coerce: aPoint.
	aTransformation := self unity.
	aTransformation setG: (thePoint x / thePoint z) negated.
	aTransformation setH: (thePoint y / thePoint z) negated.
	^ aTransformation