testing
whichSideOf: aPlane
	| anArray hasPlus hasMinus hasZero |
	anArray := self asPointArray collect: [ :aPoint | aPoint whichSideOf: aPlane ].
	hasPlus := anArray includes: 1.
	hasMinus := anArray includes: -1.
	(hasPlus and: [ hasMinus ])
		ifTrue: [ ^ 0 ].
	hasZero := anArray includes: 0.
	hasZero
		ifTrue: [ ^ 0 ].
	(hasMinus and: [ hasPlus not ])
		ifTrue: [ ^ -1 ].
	^ 1