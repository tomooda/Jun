*Jun-UFFIOpenGL
uffiOpenGLRenderingContext
	self depth ~= 32
		ifTrue: [ ^ self error: 'UFFI supports only depth32 forms.' ].
	^ JunUFFIOpenGLRenderingContext on: self