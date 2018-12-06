event handling
handleMouseUp: aMouseEvent
	self stopSteppingSelector: #handleMouseStillDown:.
	self endStroke: aMouseEvent.
	aMouseEvent wasHandled: true