lighting
enableLightIndex: anInteger
	self activate: [ :gl | gl enable: GL_LIGHT0 + anInteger ]