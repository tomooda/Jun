functions
vectorProduct: aPoint
	^ self class x: y * aPoint z - (z * aPoint y) y: z * aPoint x - (x * aPoint z) z: x * aPoint y - (y * aPoint x)