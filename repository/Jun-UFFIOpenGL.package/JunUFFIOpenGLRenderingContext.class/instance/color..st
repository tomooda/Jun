accessing
color: aColor
	super color: aColor.
	aColor ifNil: [ ^ self ].
	self
		activate: [ :gl | 
			gl
				color4f_red: aColor red
				green: aColor green
				blue: aColor blue
				alpha: aColor alpha ]