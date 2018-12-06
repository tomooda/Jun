lighting
lightIndex: index0to7 parallel: direction color: aColor
	| position lightColor |
	position := direction negated asByteArray4f.
	lightColor := aColor asByteArray4f.
	self
		activate: [ :gl | 
			| index |
			index := GL_LIGHT0 + index0to7.
			gl enable: GL_LIGHTING.
			gl enable: index.
			gl lightfv_light: index pname: GL_POSITION params: position.
			gl lightfv_light: index pname: GL_DIFFUSE params: lightColor.
			gl lightfv_light: index pname: GL_SPECULAR params: lightColor ]