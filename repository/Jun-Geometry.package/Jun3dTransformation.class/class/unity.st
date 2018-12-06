constants access
unity
	"Jun3dTransformation unity"

	| aTransformation |
	aTransformation := self basicNew.
	aTransformation
		setA: 1;
		setB: 0;
		setC: 0;
		setP: 0.
	aTransformation
		setD: 0;
		setE: 1;
		setF: 0;
		setQ: 0.
	aTransformation
		setG: 0;
		setH: 0;
		setI: 1;
		setR: 0.
	aTransformation
		setL: 0;
		setM: 0;
		setN: 0;
		setS: 1.
	^ aTransformation