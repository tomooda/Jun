accessing
atS: s andT: t
	^ Jun3dPoint
		x: self x0 + (self f1 * s) + (self f2 * t)
		y: self y0 + (self g1 * s) + (self g2 * t)
		z: self z0 + (self h1 * s) + (self h2 * t)