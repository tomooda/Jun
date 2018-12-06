class access
suchThat: aBlock ifAbsent: errorBlock
	self
		subclassesDo: [ :subclass | 
			(aBlock value: subclass)
				ifTrue: [ ^ subclass ] ].
	^ errorBlock value