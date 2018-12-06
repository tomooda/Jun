class access
number: anInteger
	^ self suchThat: [ :element | element number = anInteger ] ifAbsent: [  ]