session management
createDepthBuffer
	depthTexture := (UFFIOpenGLTextureHandle for: context) generate.
	self resizeDepthBuffer.
	context gl
		framebufferTexture2DEXT_target: GL_FRAMEBUFFER_EXT
		attachment: GL_DEPTH_ATTACHMENT_EXT
		textarget: GL_TEXTURE_2D
		texture: depthTexture handle
		level: 0