constant access
unity
	"Jun2dTransformation unity."

	| aTransformation |
	aTransformation := self basicNew.
	aTransformation
		setA: 1;
		setB: 0;
		setP: 0.
	aTransformation
		setC: 0;
		setD: 1;
		setQ: 0.
	aTransformation
		setM: 0;
		setN: 0;
		setS: 1.
	^ aTransformation