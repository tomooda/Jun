defaults
defaultMaxPeriod
	^ (JunAtom allSubclasses collect: [ :atomClass | atomClass period ]) max