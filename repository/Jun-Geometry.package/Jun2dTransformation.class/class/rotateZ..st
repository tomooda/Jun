typical transformation
rotateZ: anAngle
	"Jun2dTransformation rotateZ: (JunAngle fromDeg: 45)."

	| theAngle aTransformation |
	theAngle := JunAngle coerce: anAngle.
	aTransformation := self unity.
	aTransformation setA: theAngle cos.
	aTransformation setB: theAngle sin.
	aTransformation setC: theAngle sin negated.
	aTransformation setD: theAngle cos.
	^ aTransformation