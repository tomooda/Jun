holding
holdForMilliseconds: millisecondTime do: aBlock 
	"
	| startTime endTime |
	startTime := Time millisecondClockValue.
	JunControlUtility holdForMilliseconds: 10000 do: [Transcript cr; show: 'd '].
	endTime := Time millisecondClockValue.
	Transcript show: (endTime - startTime) printString.
	"

	| timeLimit resultValue |
	timeLimit := Time millisecondClockValue + millisecondTime.
	resultValue := aBlock value.
	[Time millisecondClockValue < timeLimit] whileTrue: [Processor yield].
	^resultValue