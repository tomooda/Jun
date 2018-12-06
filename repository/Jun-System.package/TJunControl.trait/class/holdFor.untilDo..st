holding
holdFor: millisecondTime untilDo: aBlock 
	"
	[JunControlUtility
		holdFor: 10000 
		untilDo: [Transcript show: 'u '. ActiveHand anyButtonPressed]] forkAt: Processor lowestPriority."

	| timeLimit |
	timeLimit := Time millisecondClockValue + millisecondTime.
	[Time millisecondClockValue < timeLimit] whileTrue: 
			[aBlock value = true ifTrue: [^true].
			Processor yield].
	^false