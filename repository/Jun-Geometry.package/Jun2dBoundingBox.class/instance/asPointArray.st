converting
asPointArray
	^ Array
		with: self origin
		with: self corner x _, self origin y
		with: self corner
		with: self origin x _, self corner y