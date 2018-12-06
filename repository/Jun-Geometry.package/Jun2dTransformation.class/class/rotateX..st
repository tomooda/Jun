typical transformation
rotateX: anAngle
	"Jun2dTransformation rotateX: (JunAngle fromDeg: 45)."

	| theAngle aTransformation |
	theAngle := JunAngle coerce: anAngle.
	aTransformation := self unity.
	aTransformation setD: theAngle cos.
	aTransformation setQ: theAngle sin.
	aTransformation setN: theAngle sin negated.
	aTransformation setS: theAngle cos.
	^ aTransformation