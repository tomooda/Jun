accessing
atY: y
	"(Jun2dLine from: (0 , 0) to: (1 , 1)) atY: 0.5."
	"(Jun2dLine from: (0 , 0) to: (1 , 1)) atY: -5."
	"(Jun2dLine from: (0 , 0) to: (1 , 2)) atY: 0.5."
	"(Jun2dLine from: (0 , 0) to: (1 , 2)) atY: -5."

	(self tAtY: y) ifNotNil: [ :t | self atT: t ]