typical transformation
swapXY
	"Jun2dTransformation transpose."

	| aTransformation |
	aTransformation := self unity.
	aTransformation setA: 0.0.
	aTransformation setB: 1.0.
	aTransformation setC: 1.0.
	aTransformation setD: 0.0.
	^ aTransformation