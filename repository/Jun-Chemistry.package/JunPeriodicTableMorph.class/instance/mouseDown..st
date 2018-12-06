event handling
mouseDown: aMouseEvent
	| group period  |
	group := (aMouseEvent position x - self bounds left) * 18 // self bounds width + 1.
	period := (aMouseEvent position y - self bounds top) * self maxPeriod // self bounds height + 1.
	selectedAtom := JunAtom period: period group: group.
	self changed.
	action ifNotNil: [ action cull: selectedAtom ]