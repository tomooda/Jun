holding
holdForMicroseconds: microsecondTime do: aBlock 
	"
	| startTime endTime |
	startTime := Time microsecondClock.
	JunControlUtility holdForMicroseconds: 10000 * 1000 do: [Transcript cr; show: 'd '].
	endTime := Time microsecondClock.
	Transcript show: (endTime - startTime) printString.
	"

	| timeLimit resultValue |
	timeLimit := Time microsecondClockValue + microsecondTime.
	resultValue := aBlock value.
	[Time microsecondClockValue < timeLimit] whileTrue: [Processor yield].
	^resultValue