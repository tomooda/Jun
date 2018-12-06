zoom
zoom: factor
	| min max |
	fovy := fovy div: factor.
	min := 0.001.
	max := 180 - min.
	fovy deg > max
		ifTrue: [ fovy := JunAngle fromDeg: max ].
	fovy deg < min
		ifTrue: [ fovy := JunAngle fromDeg: min ].
	zoomHeight := (fovy / 2) tan * self distance * 2