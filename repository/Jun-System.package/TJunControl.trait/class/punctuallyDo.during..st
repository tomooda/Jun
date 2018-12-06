evaluating
punctuallyDo: aBlock during: millisecondTime
	"
	| startTime endTime |
	startTime := Time millisecondClockValue.
	JunControlUtility punctuallyDo: [[true] whileTrue: [Transcript show: ' p']] during: 1000.
	endTime := Time millisecondClockValue.
	Transcript cr; show: (endTime - startTime) printString.
	"

	^ [ self punctuallyDo: aBlock forMicroseconds: millisecondTime * 1000 ]
		on: MessageNotUnderstood 
		do: [ :exception | exception return: (self punctuallyDo: aBlock forMilliseconds: millisecondTime) ]