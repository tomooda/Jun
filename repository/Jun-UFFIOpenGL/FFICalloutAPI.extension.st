Extension { #name : #FFICalloutAPI }

{ #category : #'*Jun-UFFIOpenGL' }
FFICalloutAPI >> openGLFunction: functionSignature library: moduleNameOrLibrary [

	| sender ffiMethod ffiMethodSelector |
	sender := self senderContext.
	ffiMethodSelector := self uFFIEnterMethodSelector. "Build new method"
	ffiMethod := self newBuilder build: [ :builder |
		             builder
			             signature: functionSignature;
			             sender: sender;
			             fixedArgumentCount: fixedArgumentCount;
			             library: moduleNameOrLibrary ].
	ffiMethod
		selector: sender selector;
		methodClass: sender methodClass. "Replace with generated ffi method, but save old one for future use"
	ffiMethod
		propertyAt: #ffiNonCompiledMethod
		put: (sender methodClass methodDict at: sender selector). "For senders search, one need to keep the selector in the properties"
	ffiMethod propertyAt: #ffiMethodSelector put: ffiMethodSelector.
	sender methodClass methodDict at: sender selector put: ffiMethod. "Register current method as compiled for ffi"
	FFIMethodRegistry uniqueInstance registerMethod: ffiMethod. "Resend"
	sender return: ([
		 sender receiver withArgs: sender arguments executeMethod: ffiMethod ]
			 on: SymbolNotFoundError
			 do: [ :ex |
				"try glGetProcAddress for extension functions"
				 ex resumeUnchecked:
					 (SDL2 glGetProcAddress: (ex instVarNamed: 'symbolName')) ]).
	^ self
]
