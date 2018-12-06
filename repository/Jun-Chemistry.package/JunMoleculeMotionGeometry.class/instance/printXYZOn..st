printing
printXYZOn: aStream
	self do: [ :molecule | molecule printXYZOn: aStream ]