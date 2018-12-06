accessing
atomAt: aJun3dPoint ifAbsent: errorBlock
	moleculeGeometry
		atomsDo: [ :atom | 
			atom covalentRadius  / 2.0 > (atom position as2dPoint distance: aJun3dPoint as2dPoint)
				ifTrue: [ ^ atom ] ].
	atomBuffer
		do: [ :atom | 
			atom covalentRadius / 2.0 > (atom position as2dPoint distance: aJun3dPoint as2dPoint)
				ifTrue: [ ^ atom ] ].
	^ errorBlock value