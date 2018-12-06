transforming
product: aTransformation
	| transformation |
	transformation := self class basicNew.
	transformation
		setA: a * aTransformation a + (b * aTransformation d) + (c * aTransformation g) + (p * aTransformation l).
	transformation
		setB: a * aTransformation b + (b * aTransformation e) + (c * aTransformation h) + (p * aTransformation m).
	transformation
		setC: a * aTransformation c + (b * aTransformation f) + (c * aTransformation i) + (p * aTransformation n).
	transformation
		setP: a * aTransformation p + (b * aTransformation q) + (c * aTransformation r) + (p * aTransformation s).
	transformation
		setD: d * aTransformation a + (e * aTransformation d) + (f * aTransformation g) + (q * aTransformation l).
	transformation
		setE: d * aTransformation b + (e * aTransformation e) + (f * aTransformation h) + (q * aTransformation m).
	transformation
		setF: d * aTransformation c + (e * aTransformation f) + (f * aTransformation i) + (q * aTransformation n).
	transformation
		setQ: d * aTransformation p + (e * aTransformation q) + (f * aTransformation r) + (q * aTransformation s).
	transformation
		setG: g * aTransformation a + (h * aTransformation d) + (i * aTransformation g) + (r * aTransformation l).
	transformation
		setH: g * aTransformation b + (h * aTransformation e) + (i * aTransformation h) + (r * aTransformation m).
	transformation
		setI: g * aTransformation c + (h * aTransformation f) + (i * aTransformation i) + (r * aTransformation n).
	transformation
		setR: g * aTransformation p + (h * aTransformation q) + (i * aTransformation r) + (r * aTransformation s).
	transformation
		setL: l * aTransformation a + (m * aTransformation d) + (n * aTransformation g) + (s * aTransformation l).
	transformation
		setM: l * aTransformation b + (m * aTransformation e) + (n * aTransformation h) + (s * aTransformation m).
	transformation
		setN: l * aTransformation c + (m * aTransformation f) + (n * aTransformation i) + (s * aTransformation n).
	transformation
		setS: l * aTransformation p + (m * aTransformation q) + (n * aTransformation r) + (s * aTransformation s).
	^ transformation