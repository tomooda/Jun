evaluating
do: aBlock forMicroseconds: microsecondTime
	"
	| startTime endTime |
	startTime := Time microsecondClockValue.
	JunControlUtility do: [10 timesRepeat: [Transcript show: ' d']] forMicroseconds: 1000 * 1000.
	endTime := Time microsecondClockValue.
	Transcript cr; show: (endTime - startTime) printString.
	"

	| timeLimit |
	microsecondTime <= 0
		ifTrue: [ ^ aBlock value ].
	^ self
		assert: [ timeLimit := Time microsecondClockValue + microsecondTime ]
		do: aBlock
		ensure: [ 
			Processor yield.
			((timeLimit - Time microsecondClockValue) * 1000) nanoSeconds wait ]