accessing
color: aColor alpha: aNumber
	color := aColor alpha: (aNumber min: 1.0 max: 0.0)