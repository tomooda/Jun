Class {
	#name : #JunUFFIOpenGLOffscreenTextureBuffer,
	#superclass : #UFFIOpenGLOffscreenTextureBuffer,
	#category : 'Jun-UFFIOpenGL'
}

{ #category : #'session management' }
JunUFFIOpenGLOffscreenTextureBuffer >> createDepthBuffer [
	depthTexture := (UFFIOpenGLTextureHandle for: context) generate.
	self resizeDepthBuffer.
	context gl
		framebufferTexture2DEXT_target: GL_FRAMEBUFFER_EXT
		attachment: GL_DEPTH_ATTACHMENT_EXT
		textarget: GL_TEXTURE_2D
		texture: depthTexture handle
		level: 0
]

{ #category : #'session management' }
JunUFFIOpenGLOffscreenTextureBuffer >> createDepthStencilBuffer [
	self createDepthBuffer
]

{ #category : #'session management' }
JunUFFIOpenGLOffscreenTextureBuffer >> resizeDepthBuffer [
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
]

{ #category : #'session management' }
JunUFFIOpenGLOffscreenTextureBuffer >> resizeDepthStencilBuffer [
	self resizeDepthBuffer
]
