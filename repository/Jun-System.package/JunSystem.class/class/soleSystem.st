instance creation
soleSystem
	soleSystem isNil
		ifTrue: [ soleSystem := super new ].
	^ soleSystem