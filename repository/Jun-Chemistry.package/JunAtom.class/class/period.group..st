class access
period: period group: group
	^ self suchThat: [ :element | element period = period and: [ element group = group ] ] ifAbsent: [  ]