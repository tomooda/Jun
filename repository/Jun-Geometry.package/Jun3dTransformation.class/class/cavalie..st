typical transformation
cavalie: anAngle
	"Jun3dTransformation cavalie: (JunAngle fromDeg: 45)."

	| theAngle aTransformation |
	theAngle := JunAngle coerce: anAngle.
	aTransformation := self unity.
	aTransformation setG: theAngle cos.
	aTransformation setH: theAngle sin.
	^ aTransformation