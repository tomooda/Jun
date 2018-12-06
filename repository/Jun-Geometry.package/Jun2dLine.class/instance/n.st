parameters
n
	"Answer my normalized constant."

	| denominator |
	denominator := f squared + g squared.
	denominator < self class accuracy
		ifTrue: [ ^ self error: 'can not define a line' ].
	^ 1.0 / denominator sqrt