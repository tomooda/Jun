z buffering
disableDepthTest
	self activate: [ :gl | gl disable: GL_DEPTH_TEST ]