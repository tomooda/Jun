*Jun-Graphics
renderingContext
	(self respondsTo: #nbglRenderingContext)
		ifTrue: [ ^ self perform: #nbglRenderingContext ].
	(self respondsTo: #uffiOpenGLRenderingContext)
		ifTrue: [ ^ self perform: #uffiOpenGLRenderingContext ].
	^ self canvasRenderingContext