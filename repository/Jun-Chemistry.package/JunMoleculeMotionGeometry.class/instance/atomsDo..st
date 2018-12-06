enumerating
atomsDo: aBlock
	self do: [ :molecule | molecule do: aBlock ]