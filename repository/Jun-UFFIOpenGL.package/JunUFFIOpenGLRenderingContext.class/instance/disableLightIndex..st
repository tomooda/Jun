lighting
disableLightIndex: anInteger
	self activate: [ :gl | gl disable: GL_LIGHT0 + anInteger ]