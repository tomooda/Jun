accessing
bondAt: aJun3dPoint ifAbsent: errorBlock
	moleculeGeometry
		bondsDo: [ :bond | 
			((bond atom1 position as2dPoint + bond atom2 position as2dPoint) / 2.0 distance: aJun3dPoint as2dPoint) < 0.5
				ifTrue: [ ^ bond ] ].
	bondBuffer
		do: [ :bond | 
			((bond atom1 position as2dPoint + bond atom2 position as2dPoint) / 2.0 distance: aJun3dPoint as2dPoint) < 0.5
				ifTrue: [ ^ bond ] ].
	^ errorBlock value