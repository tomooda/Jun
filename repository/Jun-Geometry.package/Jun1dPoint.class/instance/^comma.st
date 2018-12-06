converting
, aNumberOrJun1dPoint
	^ Jun2dPoint
		x: self x
		y:
			(aNumberOrJun1dPoint isPoint
				ifTrue: [ aNumberOrJun1dPoint x ]
				ifFalse: [ aNumberOrJun1dPoint ])