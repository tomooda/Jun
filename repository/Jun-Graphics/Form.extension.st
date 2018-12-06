Extension { #name : #Form }

{ #category : #'*Jun-Graphics' }
Form >> canvasRenderingContext [
	^ JunCanvasRenderingContext onForm: self
]

{ #category : #'*Jun-Graphics' }
Form >> renderingContext [
	(self respondsTo: #nbglRenderingContext)
		ifTrue: [ ^ self perform: #nbglRenderingContext ].
	(self respondsTo: #uffiOpenGLRenderingContext)
		ifTrue: [ ^ self perform: #uffiOpenGLRenderingContext ].
	^ self canvasRenderingContext
]
