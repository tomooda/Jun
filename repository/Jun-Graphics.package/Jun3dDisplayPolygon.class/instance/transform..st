transforming
transform: aJun3dTransformation
	| polygon |
	polygon := self copy.
	polygon setPoints: (points collect: [ :p | p transform: aJun3dTransformation ]).
	normalVectors ifNotNil: [ polygon normalVectors: (normalVectors collect: [ :n | n transform: aJun3dTransformation ]) ].
	^ polygon