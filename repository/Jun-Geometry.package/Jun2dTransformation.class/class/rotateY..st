typical transformation
rotateY: anAngle
	"Jun2dTransformation rotateY: (JunAngle fromDeg: 45)."

	| theAngle aTransformation |
	theAngle := JunAngle coerce: anAngle.
	aTransformation := self unity.
	aTransformation setA: theAngle cos.
	aTransformation setP: theAngle sin negated.
	aTransformation setM: theAngle sin.
	aTransformation setS: theAngle cos.
	^ aTransformation