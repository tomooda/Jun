functions
rotationVector
	| denominator |
	denominator := ((((f - h) ** 2 + (c - g)) ** 2 + (b - d)) ** 2) sqrt.
	^ Jun3dPoint x: (h - f) / denominator y: (c - g) / denominator z: (d - b) / denominator