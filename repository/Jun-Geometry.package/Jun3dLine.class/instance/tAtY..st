private
tAtY: aNumber
	g abs < self class accuracy
		ifTrue: [ ^ nil ].
	^ (aNumber - y0) / g