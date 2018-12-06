accessing
atZ: z
	^ (self tAtZ: z) ifNotNil: [ :t | self atT: t ]