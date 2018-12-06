adding
add: aJunPoint
	(self containsPoint: aJunPoint)
		ifFalse: [ 
			origin := origin min: aJunPoint.
			corner := corner max: aJunPoint ].
	^ aJunPoint