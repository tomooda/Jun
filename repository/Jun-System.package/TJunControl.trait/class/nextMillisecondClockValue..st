clock inquiries
nextMillisecondClockValue: tickTime
	"JunControlUtility nextMillisecondClockValue: 100."

	| currentTime nextTime |
	currentTime := Time millisecondClockValue.
	nextTime := currentTime + tickTime.
	nextTime := nextTime truncateTo: tickTime.
	(nextTime - currentTime) milliSeconds wait.
	^ nextTime