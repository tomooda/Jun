waiting
waitForMicroseconds: microsecondTime 
	"
	| startTime endTime |
	startTime := Time microsecondClock.
	JunControlUtility waitForMicroseconds: 1000 * 1000.
	endTime := Time microsecondClock.
	Transcript cr; show: (endTime - startTime) printString.
	"

	^self do: [] forMicroseconds: microsecondTime