event handling
handleMouseMove: aMouseEvent
	aMouseEvent redButtonPressed
		ifTrue: [ 
			startPoint ifNotNil: [ self continueStroke: aMouseEvent ].
			aMouseEvent wasHandled: true ]