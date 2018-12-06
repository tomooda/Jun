lighting
ambientLight: aColor
	ambientLight := aColor.
	self
		activate: [ :gl | 
			gl enable: GL_LIGHTING.
			gl enable: GL_COLOR_MATERIAL.
			gl lightModelfv_pname: GL_LIGHT_MODEL_AMBIENT params: aColor asByteArray4f.
			gl lightModeli_pname: GL_LIGHT_MODEL_LOCAL_VIEWER param: GL_FALSE.
			gl lightModeli_pname: GL_LIGHT_MODEL_TWO_SIDE param: GL_TRUE ]