testing
sign
	self > self class zero
		ifTrue: [ ^ 1 ].
	self < self class zero
		ifTrue: [ ^ -1 ].
	^ 0