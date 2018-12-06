holding
holdFor: millisecondTime do: aBlock 
	"
	| startTime endTime |
	startTime := Time millisecondClockValue.
	JunControlUtility holdFor: 10000 do: [Transcript cr; show: 'd '].
	endTime := Time millisecondClockValue.
	Transcript show: (endTime - startTime) printString.
	"

	^self holdForMilliseconds: millisecondTime do: aBlock