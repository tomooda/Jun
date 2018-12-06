displaying
flush
	canvas fillColor: self backgroundColor.
	blocks contents asSortedCollection reverseDo: [ :assoc | assoc value value ]