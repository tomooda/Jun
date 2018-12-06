parameters
n1
	"Answer my normalized constant."

	| denominator |
	denominator := self f1 squared + self g1 squared + self h1 squared.
	denominator < self class accuracy
		ifTrue: [ ^ self error: 'can not define a plane' ].
	^ 1.0 / denominator sqrt