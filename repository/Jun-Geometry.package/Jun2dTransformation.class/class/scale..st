typical transformation
scale: aPoint
	"Jun2dTransformation scale: (Jun2dPoint fromArray: #(1 2))."

	| thePoint aTransformation |
	thePoint := Jun2dPoint coerce: aPoint.
	aTransformation := self unity.
	aTransformation setA: thePoint x.
	aTransformation setD: thePoint y.
	^ aTransformation