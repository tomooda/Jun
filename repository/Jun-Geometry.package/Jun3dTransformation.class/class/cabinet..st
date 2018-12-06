typical transformation
cabinet: anAngle
	"Jun3dTransformation cabinet: (JunAngle fromDeg: 45)."

	| theAngle aTransformation |
	theAngle := JunAngle coerce: anAngle.
	aTransformation := self unity.
	aTransformation setG: theAngle cos / 2.
	aTransformation setH: theAngle sin / 2.
	^ aTransformation