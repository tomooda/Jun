parameters
n
	"Answer my normalized constant."

	| denominator |
	denominator := a squared + b squared + c squared.
	denominator < self class accuracy
		ifTrue: [ ^ self error: 'can not define a plane' ].
	^ 1.0 / denominator sqrt