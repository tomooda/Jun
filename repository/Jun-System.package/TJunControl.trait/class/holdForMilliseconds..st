holding
holdForMilliseconds: millisecondTime 
	"
	| startTime endTime |
	startTime := Time millisecondClockValue.
	JunControlUtility holdForMilliseconds: 10000.
	endTime := Time millisecondClockValue.
	Transcript cr; show: (endTime - startTime) printString.
	"

	^self holdForMilliseconds: millisecondTime untilDo: [false]