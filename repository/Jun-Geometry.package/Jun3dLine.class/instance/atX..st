accessing
atX: x
	^ (self tAtX: x) ifNotNil: [ :t | self atT: t ]