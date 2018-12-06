logout
shutDown: quitting
	quitting = true
		ifTrue: [ self logout ]
		ifFalse: [ self epilogue ]