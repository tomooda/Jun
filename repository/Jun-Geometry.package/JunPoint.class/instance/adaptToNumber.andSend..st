double dispatching
adaptToNumber: aNumber andSend: selector
	^ (self class fromNumber: aNumber) perform: selector with: self