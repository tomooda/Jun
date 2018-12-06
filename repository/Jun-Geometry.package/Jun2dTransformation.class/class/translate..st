typical transformation
translate: aPoint
	"Jun2dTransformation translate: (Jun2dPoint fromArray: #(10 20))."

	| thePoint aTransformation |
	thePoint := Jun2dPoint coerce: aPoint.
	aTransformation := self unity.
	aTransformation setM: thePoint x.
	aTransformation setN: thePoint y.
	^ aTransformation