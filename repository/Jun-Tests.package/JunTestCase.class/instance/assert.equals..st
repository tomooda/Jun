asserting
assert: actual equals: expected
	(actual isKindOf: JunPoint)
		ifTrue: [ 
			^ self
				assert: (actual distance: expected) < actual accuracy
				description: [ self comparingStringBetween: actual and: expected ] ].
	(actual isKindOf: JunAngle)
		ifTrue: [ 
			^ self
				assert: (actual rad - expected rad) abs < actual accuracy
				description: [ self comparingStringBetween: actual and: expected ] ].
	actual isNumber
		ifTrue: [ 
			^ self
				assert: (actual - expected) abs < JunGeometry accuracy
				description: [ self comparingStringBetween: actual and: expected ] ].
	^ super assert: actual equals: expected