Extension { #name : #UFFIOpenGL }

{ #category : #'*Jun-UFFIOpenGL' }
UFFIOpenGL >> ffiCall: fnSpec library: aLibrary options: callOptions fixedArgumentCount: fixedArgumentsCount [
	<ffiCalloutTranslator>

	| ffiLibrary |
	ffiLibrary := aLibrary asFFILibrary.
	^ (ffiLibrary calloutAPIClass inUFFIContext: thisContext)
		convention: self ffiCallingConvention;
		options: (ffiLibrary options), callOptions;
		fixedArgumentCount: fixedArgumentsCount;
		openGLFunction: fnSpec library: ffiLibrary
]

{ #category : #'*Jun-UFFIOpenGL' }
UFFIOpenGL >> ffiLibraryName [
	^ 'opengl32.dll'
]
