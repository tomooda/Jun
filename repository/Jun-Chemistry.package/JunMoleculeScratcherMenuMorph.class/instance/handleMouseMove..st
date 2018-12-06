event handling
handleMouseMove: aMouseEvent
	| oldSelectionIndex |
	oldSelectionIndex := selectionIndex.
	selectionIndex := nil.
	((aMouseEvent position - origin) r > self moveThreshhold and: [ actions notEmpty ])
		ifTrue: [ 
			selectionIndex := ((1 to: actions size)
				collect: [ :index | ((actions at: index) first - aMouseEvent position) r -> index ]) min value ].
	selectionIndex ~= oldSelectionIndex
		ifTrue: [ self changed ].
	^ super handleMouseMove: aMouseEvent