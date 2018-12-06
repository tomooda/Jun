holding
holdForMicroseconds: millisecondTime 
	"
	| startTime endTime |
	startTime := Time microsecondClock.
	JunControlUtility holdForMicroseconds: 10000 * 1000.
	endTime := Time microsecondClock.
	Transcript cr; show: (endTime - startTime) printString.
	"

	^self holdForMicroseconds: millisecondTime untilDo: [false]