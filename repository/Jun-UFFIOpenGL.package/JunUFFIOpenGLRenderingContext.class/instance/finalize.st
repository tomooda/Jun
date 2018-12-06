finalization
finalize
	self class cache remove: self ifAbsent: [  ].
	Transcript
		cr;
		show: 'finalized'.
	context := nil.
	frameBuffer := nil