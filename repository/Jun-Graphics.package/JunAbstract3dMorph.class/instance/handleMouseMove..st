event handling
handleMouseMove: aMouseEvent
	aMouseEvent redButtonPressed
		ifTrue: [ self dragActionAt: aMouseEvent position.
			aMouseEvent wasHandled: true ]
		ifFalse: [ dragger := nil ].
	super handleMouseMove: aMouseEvent