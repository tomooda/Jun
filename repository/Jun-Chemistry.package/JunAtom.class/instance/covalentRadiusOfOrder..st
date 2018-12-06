accessing
covalentRadiusOfOrder: anInteger
	(anInteger = 1 and: [ self bondRadius1 > 0.0 ])
		ifTrue: [ ^ self bondRadius1 ].
	(anInteger = 2 and: [ self bondRadius2 > 0.0 ])
		ifTrue: [ ^ self bondRadius2 ].
	(anInteger = 3 and: [ self bondRadius3 > 0.0 ])
		ifTrue: [ ^ self bondRadius3 ].
	^ self covalentRadius