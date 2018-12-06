accessing
tAtX: aNumber
	f abs < self class accuracy
		ifTrue: [ ^ nil ].
	^ (aNumber - x0) / f