evaluating
do: aBlock forMilliseconds: millisecondTime 
	"
	| startTime endTime |
	startTime := Time millisecondClockValue.
	JunControlUtility do: [10 timesRepeat: [Transcript show: ' d']] forMilliseconds: 1000.
	endTime := Time millisecondClockValue.
	Transcript cr; show: (endTime - startTime) printString.
	"

	| timeLimit |
	millisecondTime <= 0 ifTrue: [^aBlock value].
	^self 
		assert: [timeLimit := Time millisecondClockValue + millisecondTime]
		do: aBlock
		ensure: 
			[Processor yield.
			(timeLimit - Time millisecondClockValue) milliSeconds wait]