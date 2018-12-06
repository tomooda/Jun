evaluating
do: aBlock during: millisecondTime 
	"
	| startTime endTime |
	startTime := Time millisecondClockValue.
	JunControlUtility do: [10 timesRepeat: [Transcript show: ' d']] during: 1000.
	endTime := Time millisecondClockValue.
	Transcript cr; show: (endTime - startTime) printString.
	"

	^[self do: aBlock forMicroseconds: millisecondTime * 1000] 
		on: MessageNotUnderstood 
		do: [:exception | exception return: (self do: aBlock forMilliseconds: millisecondTime)]