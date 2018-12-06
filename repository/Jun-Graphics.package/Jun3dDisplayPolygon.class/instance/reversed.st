converting
reversed
	| polygon |
	polygon := self copy.
	polygon setPoints: points reversed.
	normalVectors ifNotNil: [ polygon normalVectors: (normalVectors collect: #negated) ].
	^ polygon