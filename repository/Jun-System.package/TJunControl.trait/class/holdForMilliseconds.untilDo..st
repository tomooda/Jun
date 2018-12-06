holding
holdForMilliseconds: millisecondTime untilDo: aBlock 
	"[
		JunControlUtility
			holdForMilliseconds: 10000 
			untilDo: [Transcript show: 'u '. Sensor anyButtonPressed]
	] forkAt: Processor lowestPriority."

	| timeLimit |
	timeLimit := Time millisecondClockValue + millisecondTime.
	[Time millisecondClockValue < timeLimit] whileTrue: 
			[aBlock value = true ifTrue: [^true].
			Processor yield].
	^false