z buffering
enableDepthTest
	self activate: [ :gl | gl enable: GL_DEPTH_TEST ]