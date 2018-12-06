examples
example3
	"JunUFFIOpenGLRenderingContext example3"

	| rc projection form |
	form := Form extent: 500 @ 500 depth: 32.
	rc := JunUFFIOpenGLRenderingContext on: form.
	projection := JunPerspectiveProjection
		eyePoint: 10 _, 10 _, 15
		sightPoint: 0 _, 0 _, 0
		upVector: 0 _, 1 _, 0
		fovy: 30 asDegrees
		near: 0.1
		far: 100.0.
	rc projection: projection.
	rc enableCullface.
	rc clear.
	rc ambientLight: Color darkGray.
	rc lightIndex: 0 parallel: (10 _, 10 _, 15) negated color: Color white.
	Jun3dDisplayObject benzene renderOn: rc.
	rc flush.
	(Delay forMilliseconds: 100) wait.
	form asMorph openInWindow