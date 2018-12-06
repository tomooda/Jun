event handling
mouseUp: aMouseEvent
	selectionIndex ifNotNil: [ owner perform: (actions at: selectionIndex) third asSymbol with: arg].
	self delete