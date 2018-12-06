login
startUp: resuming
	resuming = true
		ifTrue: [ self login ]
		ifFalse: [ self prologue ]