session management
resizeDepthBuffer
	context gl
		bindTexture_target: GL_TEXTURE_2D texture: depthTexture handle;
		texImage2D_target: GL_TEXTURE_2D
			level: 0
			internalformat: GL_DEPTH_COMPONENT
			width: extent x
			height: extent y
			border: 0
			format: GL_DEPTH_COMPONENT
			type: GL_FLOAT
			pixels: nil