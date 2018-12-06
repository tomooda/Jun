accessing
initialExtent
	| width height |
	width := ((JunAtom allSubclasses collect: [ :atomClass | font widthOfString: atomClass symbol ]) max * 2) * 18.
	height := (font height * 2) * self maxPeriod.
	^ width @ height