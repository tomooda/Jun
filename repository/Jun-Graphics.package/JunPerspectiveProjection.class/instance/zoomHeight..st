zoom
zoomHeight: aNumber
	| min max |
	self setZoomHeight: aNumber.
	fovy := JunAngle fromRad: ((self zoomHeight / 2) asFloat / self distance) arcTan * 2.
	min := 0.001.
	max := 180 - min.
	fovy deg > max
		ifTrue: [ fovy := JunAngle fromDeg: max ].
	fovy deg < min
		ifTrue: [ fovy := JunAngle fromDeg: min ]