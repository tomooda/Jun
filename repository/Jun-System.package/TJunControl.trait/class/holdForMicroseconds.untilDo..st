holding
holdForMicroseconds: microsecondTime untilDo: aBlock 
	"[
		JunControlUtility
			holdForMicroseconds: 10000 * 1000 
			untilDo: [Transcript show: 'u '. Sensor anyButtonPressed]
	] forkAt: Processor lowestPriority."

	| timeLimit |
	timeLimit := Time microsecondClockValue + microsecondTime.
	[Time microsecondClockValue < timeLimit] whileTrue: 
			[aBlock value = true ifTrue: [^true].
			Processor yield].
	^false