typical transformation
rotateY: anAngle
	"Jun3dTransformation rotateY: (JunAngle fromDeg: 45)."

	| theAngle aTransformation |
	theAngle := JunAngle coerce: anAngle.
	aTransformation := self unity.
	aTransformation setA: theAngle cos.
	aTransformation setC: theAngle sin negated.
	aTransformation setG: theAngle sin.
	aTransformation setI: theAngle cos.
	^ aTransformation