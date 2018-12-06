evaluating
fork: aBlock during: millisecondTime
	"JunControlUtility fork: [[true] whileTrue: [Transcript show: ' f']] during: 1000."

	^ [ self fork: aBlock forMicroseconds: millisecondTime * 1000 ]
		on: MessageNotUnderstood 
		do: [ :exception | exception return: (self fork: aBlock forMilliseconds: millisecondTime) ]