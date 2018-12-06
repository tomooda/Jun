accessing
atT: t
	"(Jun2dLine from: (0 , 0) to: (1 , 1)) atT: 0."
	"(Jun2dLine from: (0 , 0) to: (1 , 1)) atT: 1."
	"(Jun2dLine from: (0 , 0) to: (1 , 1)) atT: -1."

	^ Jun2dPoint x: f * t + x0 y: g * t + y0