waiting
waitDuring: millisecondTime 
	"
	| startTime endTime |
	startTime := Time millisecondClockValue.
	JunControlUtility waitDuring: 1000.
	endTime := Time millisecondClockValue.
	Transcript cr; show: (endTime - startTime) printString.
	"

	^self do: [] during: millisecondTime