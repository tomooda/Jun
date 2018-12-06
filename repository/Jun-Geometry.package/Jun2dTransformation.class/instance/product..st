transforming
product: aTransformation
	"(Jun2dTransformation fromArray: #(1 0 0 0 1 0 10 20 1)) 
	product: (Jun2dTransformation fromArray: #(1 0 0 0 1 0 -10 -20 1))."

	| transformation |
	transformation := self class basicNew.
	transformation setA: a * aTransformation a + (b * aTransformation c) + (p * aTransformation m).
	transformation setB: a * aTransformation b + (b * aTransformation d) + (p * aTransformation n).
	transformation setP: a * aTransformation p + (b * aTransformation q) + (p * aTransformation s).
	transformation setC: c * aTransformation a + (d * aTransformation c) + (q * aTransformation m).
	transformation setD: c * aTransformation b + (d * aTransformation d) + (q * aTransformation n).
	transformation setQ: c * aTransformation p + (d * aTransformation q) + (q * aTransformation s).
	transformation setM: m * aTransformation a + (n * aTransformation c) + (s * aTransformation m).
	transformation setN: m * aTransformation b + (n * aTransformation d) + (s * aTransformation n).
	transformation setS: m * aTransformation p + (n * aTransformation q) + (s * aTransformation s).
	^ transformation