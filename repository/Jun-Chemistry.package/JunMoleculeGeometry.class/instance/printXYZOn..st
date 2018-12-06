printing
printXYZOn: aStream
	aStream
		nextPutAll: self size printString;
		cr;
		cr.
	self
		do: [ :atom | 
			aStream
				nextPutAll: atom symbol;
				nextPutAll: '	';
				nextPutAll: atom position x printString;
				nextPutAll: '	';
				nextPutAll: atom position y printString;
				nextPutAll: '	';
				nextPutAll: atom position z printString;
				cr ]