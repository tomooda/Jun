examples
example0
	"JunUFFIOpenGLRenderingContext example0"

	| rc form |
	form := Form extent: 500 @ 500 depth: 32.
	rc := JunUFFIOpenGLRenderingContext on: form.
	rc backgroundColor: Color blue.
	rc clear.
	rc flush.
	rc form asMorph openInWindow