typical transformation
rotateX: anAngle
	"Jun3dTransformation rotateX: (JunAngle fromDeg: 45)."

	| theAngle aTransformation |
	theAngle := JunAngle coerce: anAngle.
	aTransformation := self unity.
	aTransformation setE: theAngle cos.
	aTransformation setF: theAngle sin.
	aTransformation setH: theAngle sin negated.
	aTransformation setI: theAngle cos.
	^ aTransformation