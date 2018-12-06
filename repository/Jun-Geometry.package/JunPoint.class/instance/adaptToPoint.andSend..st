double dispatching
adaptToPoint: aPoint andSend: selector
	^ (self class fromPoint: aPoint) perform: selector with: self