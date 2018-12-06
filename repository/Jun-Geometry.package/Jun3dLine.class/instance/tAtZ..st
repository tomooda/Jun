private
tAtZ: aNumber
	h abs < self class accuracy
		ifTrue: [ ^ nil ].
	^ (aNumber - z0) / h