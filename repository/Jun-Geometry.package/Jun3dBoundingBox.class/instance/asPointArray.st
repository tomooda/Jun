converting
asPointArray
	^ (Array new: 8)
		at: 1 put: self origin;
		at: 2 put: self corner x _, self origin y _, self origin z;
		at: 3 put: self corner x _, self corner y _, self origin z;
		at: 4 put: self origin x _, self corner y _, self origin z;
		at: 5 put: self corner;
		at: 6 put: self corner x _, self origin y _, self corner z;
		at: 7 put: self origin x _, self origin y _, self corner z;
		at: 8 put: self origin x _, self corner y _, self corner z;
		yourself