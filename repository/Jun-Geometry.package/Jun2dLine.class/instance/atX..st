accessing
atX: x
	"(Jun2dLine from: (0 , 0) to: (1 , 1)) atX: 0.5."
	"(Jun2dLine from: (0 , 0) to: (1 , 1)) atX: -5."
	"(Jun2dLine from: (0 , 0) to: (1 , 2)) atX: 0.5."
	"(Jun2dLine from: (0 , 0) to: (1 , 2)) atX: -5."

	^ (self tAtX: x) ifNotNil: [ :t | self atT: t ]