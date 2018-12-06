constant access
zero
	"Jun2dTransformation zero."

	| aTransformation |
	aTransformation := self basicNew.
	aTransformation
		setA: 0;
		setB: 0;
		setP: 0.
	aTransformation
		setC: 0;
		setD: 0;
		setQ: 0.
	aTransformation
		setM: 0;
		setN: 0;
		setS: 0.
	^ aTransformation