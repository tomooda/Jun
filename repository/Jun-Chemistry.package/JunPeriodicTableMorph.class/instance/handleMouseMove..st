event handling
handleMouseMove: aMouseEvent
	| group period oldAtom |
	group := (aMouseEvent position x - self bounds left) * 18 // self bounds width + 1.
	period := (aMouseEvent position y - self bounds top) * self maxPeriod // self bounds height + 1.
	oldAtom := hoverAtom.
	hoverAtom := JunAtom period: period group: group.
	oldAtom = hoverAtom
		ifFalse: [ self changed ].
	^ super handleMouseMove: aMouseEvent