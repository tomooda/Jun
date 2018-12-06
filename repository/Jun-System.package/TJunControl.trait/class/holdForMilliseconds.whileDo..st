holding
holdForMilliseconds: millisecondTime whileDo: aBlock 
	"[
		JunControlUtility
			holdForMilliseconds: 10000 
			whileDo: [Transcript show: 'w '. Sensor noButtonPressed]
	] forkAt: Processor lowestPriority."

	^self holdForMilliseconds: millisecondTime untilDo: [aBlock value ~= true]