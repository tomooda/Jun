comparing
equal: aTransformation
	self class == aTransformation class
		ifFalse: [ ^ false ].
	^ ((((((((a - aTransformation a) abs < self accuracy and: [ (b - aTransformation b) abs < self accuracy ])
		and: [ (p - aTransformation p) abs < self accuracy ]) and: [ (c - aTransformation c) abs < self accuracy ])
		and: [ (d - aTransformation d) abs < self accuracy ]) and: [ (q - aTransformation q) abs < self accuracy ])
		and: [ (m - aTransformation m) abs < self accuracy ]) and: [ (n - aTransformation n) abs < self accuracy ])
		and: [ (s - aTransformation s) abs < self accuracy ]