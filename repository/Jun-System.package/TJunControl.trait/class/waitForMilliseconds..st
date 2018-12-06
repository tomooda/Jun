waiting
waitForMilliseconds: millisecondTime 
	"
	| startTime endTime |
	startTime := Time millisecondClockValue.
	JunControlUtility waitForMilliseconds: 1000.
	endTime := Time millisecondClockValue.
	Transcript cr; show: (endTime - startTime) printString.
	"

	^self do: [] forMilliseconds: millisecondTime