holding
holdFor: millisecondTime whileDo: aBlock 
	"[JunControlUtility
		holdFor: 10000 
		whileDo: [Transcript show: 'w '. ActiveHand noButtonPressed]] forkAt: Processor lowestPriority."

	^self holdFor: millisecondTime untilDo: [aBlock value ~= true]