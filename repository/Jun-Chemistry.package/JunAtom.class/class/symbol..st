class access
symbol: aString
	^ self suchThat: [ :element | element symbol = aString ] ifAbsent: [  ]