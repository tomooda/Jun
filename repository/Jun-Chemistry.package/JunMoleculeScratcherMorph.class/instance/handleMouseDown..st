event handling
handleMouseDown: aMouseEvent
	aMouseEvent yellowButtonPressed
		ifTrue: [ ^ self yellowButtonDown: aMouseEvent ].
	aMouseEvent wasHandled: true.
	self
		startStepping: #handleMouseStillDown:
		at: Time millisecondClockValue + self mouseStillDownThreshold
		arguments: {(aMouseEvent copy resetHandlerFields)}
		stepTime: nil.
	self startStroke: aMouseEvent