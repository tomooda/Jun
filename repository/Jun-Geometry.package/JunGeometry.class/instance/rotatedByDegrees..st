transforming
rotatedByDegrees: degrees
	^ self transform: (self transformationClass rotate: (self angleClass fromDeg: degrees))