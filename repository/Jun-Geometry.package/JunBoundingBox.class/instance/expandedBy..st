functions
expandedBy: delta
	(delta isKindOf: self class)
		ifTrue: [ ^ self class origin: self origin - delta origin corner: self corner + delta corner ].
	^ self class origin: self origin - delta corner: self corner + delta