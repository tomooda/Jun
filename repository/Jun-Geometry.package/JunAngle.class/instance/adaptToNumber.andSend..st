double dispatching
adaptToNumber: aNumber andSend: selector
	^ (self class fromRad: aNumber) perform: selector with: self