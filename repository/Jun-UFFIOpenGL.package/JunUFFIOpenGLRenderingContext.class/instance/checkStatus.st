private
checkStatus
	| status |
	self
		activate: [ :gl | 
			status := gl checkFramebufferStatusEXT: GL_FRAMEBUFFER.
			status = GL_FRAMEBUFFER_COMPLETE
				ifFalse:
					[ #(#GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT #GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT #GL_FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER #GL_FRAMEBUFFER_INCOMPLETE_READ_BUFFER #GL_FRAMEBUFFER_UNSUPPORTED #GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE #GL_FRAMEBUFFER_UNDEFINED)
						do: [ :sym | 
							(self class bindingOf: sym)
								ifNotNil: [ :b | 
									status = b value
										ifTrue: [ ^ self error: 'Frame buffer is incomplete: ' , b key ] ] ].
					^ self error: 'Frame buffer status: Unknown error' ].
			^ true	"ok" ]