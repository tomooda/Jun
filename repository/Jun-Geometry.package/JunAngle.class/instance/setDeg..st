private
setDeg: degrees
	| aValue |
	aValue := degrees asFloat.
	self setRad: aValue degreesToRadians.
	deg := aValue