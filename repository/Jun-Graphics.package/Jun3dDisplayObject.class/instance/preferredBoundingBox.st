bounds access
preferredBoundingBox
	| minX minY minZ maxX maxY maxZ |
	minX := nil.
	minY := nil.
	minZ := nil.
	maxX := nil.
	maxY := nil.
	maxZ := nil.
	self
		pointsDo: [ :p | 
			minX == nil
				ifTrue: [ minX := p x ]
				ifFalse: [ minX := minX min: p x ].
			minY == nil
				ifTrue: [ minY := p y ]
				ifFalse: [ minY := minY min: p y ].
			minZ == nil
				ifTrue: [ minZ := p z ]
				ifFalse: [ minZ := minZ min: p z ].
			maxX == nil
				ifTrue: [ maxX := p x ]
				ifFalse: [ maxX := maxX max: p x ].
			maxY == nil
				ifTrue: [ maxY := p y ]
				ifFalse: [ maxY := maxY max: p y ].
			maxZ == nil
				ifTrue: [ maxZ := p z ]
				ifFalse: [ maxZ := maxZ max: p z ] ].
	minX == nil
		ifTrue: [ minX := 0 ].
	minY == nil
		ifTrue: [ minY := 0 ].
	minZ == nil
		ifTrue: [ minZ := 0 ].
	maxX == nil
		ifTrue: [ maxX := 0 ].
	maxY == nil
		ifTrue: [ maxY := 0 ].
	maxZ == nil
		ifTrue: [ maxZ := 0 ].
	^ Jun3dBoundingBox origin: minX _, minY _, minZ corner: maxX _, maxY _, maxZ