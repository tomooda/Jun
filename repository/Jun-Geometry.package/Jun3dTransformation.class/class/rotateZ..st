typical transformation
rotateZ: anAngle
	"Jun3dTransformation rotateZ: (JunAngle fromDeg: 45)."

	| theAngle aTransformation |
	theAngle := JunAngle coerce: anAngle.
	aTransformation := self unity.
	aTransformation setA: theAngle cos.
	aTransformation setB: theAngle sin.
	aTransformation setD: theAngle sin negated.
	aTransformation setE: theAngle cos.
	^ aTransformation