converting
asXYZString
	^ String new: 0 streamContents: [ :stream | self printXYZOn: stream ]