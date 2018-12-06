private
setForm: aForm
	| gl |
	forms := WeakArray with: aForm.
	context := UFFIOpenGLContext new.
	self class cache add: self.
	aForm toFinalizeSend: #finalize: to: self with: nil.
	gl := context gl.
	frameBuffer := JunUFFIOpenGLOffscreenTextureBuffer new
		extent: aForm extent;
		context: context;
		yourself.
	context
		asCurrentDo: [ frameBuffer activate.
			gl
				viewport_x: 0
					y: 0
					width: aForm width
					height: aForm height;
				depthMask: true;
				enable: GL_NORMALIZE;
				enable: GL_DEPTH_TEST;
				clearColor_red: self backgroundColor red
					green: self backgroundColor green
					blue: self backgroundColor blue
					alpha: self backgroundColor alpha;
				clear: GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT ]