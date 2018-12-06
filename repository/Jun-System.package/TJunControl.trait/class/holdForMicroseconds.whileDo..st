holding
holdForMicroseconds: millisecondTime whileDo: aBlock 
	"[
		JunControlUtility
			holdForMicroseconds: 10000 * 1000
			whileDo: [Transcript show: 'w '. Sensor noButtonPressed]
	] forkAt: Processor lowestPriority."

	^self holdForMicroseconds: millisecondTime untilDo: [aBlock value ~= true]