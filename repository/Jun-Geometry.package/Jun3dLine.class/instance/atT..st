accessing
atT: t
	"(Jun3dLine from: (0 , 0 , 0) to: (1 , 1 , 1)) atT: 0."
	"(Jun3dLine from: (0 , 0 , 0) to: (1 , 1 , 1)) atT: 1."
	"(Jun3dLine from: (0 , 0 , 0) to: (1 , 1 , 1)) atT: -1."
	"(Jun3dLine from: (0 , 0 , 0) to: (1 , 1 , 1)) atT: 2."
	"(Jun3dLine from: (0 , 0 , 0) to: (1 , 1 , 1)) atT: -2."

	^ Jun3dPoint x: f * t + x0 y: g * t + y0 z: h * t + z0