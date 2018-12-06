accessing
backgroundColor: aColor
	super backgroundColor: aColor.
	self
		activate: [ :gl | 
			gl
				clearColor_red: self backgroundColor red
				green: self backgroundColor green
				blue: self backgroundColor blue
				alpha: self backgroundColor alpha ]