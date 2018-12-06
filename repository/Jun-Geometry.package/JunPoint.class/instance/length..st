functions
length: aNumber
	| length scale |
	length := self length.
	length > self class accuracy
		ifTrue: [ scale := aNumber / length ]
		ifFalse: [ ^ self ].
	^ self * scale