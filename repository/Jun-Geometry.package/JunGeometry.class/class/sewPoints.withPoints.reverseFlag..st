utilities
sewPoints: firstPoints withPoints: secondPoints reverseFlag: aBoolean 
	"JunGeometry 
		sewPoints: (Array 
				with: -1 , 0 , 0
				with: 0 , 0 , 0
				with: 1 , 0 , 0)
		withPoints: (Array 
				with: -1 , 1 , 0
				with: 0 , 1 , 0
				with: 1 , 1 , 0)
		reverseFlag: false."

	| aCollection firstTriPoints secondTriPoints |
	aCollection := OrderedCollection new: (firstPoints size - 1) * 2.
	(1 to: firstPoints size - 1) with: (2 to: firstPoints size)
		do: 
			[:firstIndex :secondIndex | 
			| firstPoint secondPoint thirdPoint forthPoint |
			firstPoint := firstPoints at: firstIndex.
			secondPoint := secondPoints at: firstIndex.
			thirdPoint := firstPoints at: secondIndex.
			forthPoint := secondPoints at: secondIndex.
			firstTriPoints := Array 
						with: firstPoint
						with: secondPoint
						with: thirdPoint.
			secondTriPoints := Array 
						with: secondPoint
						with: forthPoint
						with: thirdPoint.
			aBoolean = false 
				ifTrue: 
					[firstTriPoints := firstTriPoints reverse.
					secondTriPoints := secondTriPoints reverse].
			aCollection add: firstTriPoints.
			aCollection add: secondTriPoints].
	^aCollection