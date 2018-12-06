evaluating
do: aBlock framesPerSecond: aNumber
	"
	| startTime endTime |
	startTime := Time millisecondClockValue.
	10 timesRepeat: [JunControlUtility do: [] framesPerSecond: 10].
	endTime := Time millisecondClockValue.
	Transcript cr; show: (endTime - startTime) printString.
	"

	aNumber <= 0
		ifTrue: [ ^ aBlock value ].
	^ self do: aBlock forMilliseconds: (1000 / (0.001 max: (aNumber min: 1000))) rounded