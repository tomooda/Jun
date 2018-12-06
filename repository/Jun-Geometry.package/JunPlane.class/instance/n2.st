parameters
n2
	"Answer my normalized constant."

	| denominator |
	denominator := self f2 squared + self g2 squared + self h2 squared.
	denominator < self class accuracy
		ifTrue: [ ^ self error: 'can not define a plane' ].
	^ 1.0 / denominator sqrt