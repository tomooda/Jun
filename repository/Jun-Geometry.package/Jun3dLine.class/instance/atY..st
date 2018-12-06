accessing
atY: y
	^ (self tAtY: y) ifNotNil: [ :t | self atT: t ]