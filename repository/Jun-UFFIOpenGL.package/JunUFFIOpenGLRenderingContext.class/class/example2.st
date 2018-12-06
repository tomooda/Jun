examples
example2
	"JunUFFIOpenGLRenderingContext example2"

	| rc xarrow yarrow zarrow floorPoints ceilPoints leftPoints rightPoints nearPoints farPoints projection angle form |
	form := Form extent: 500 @ 500 depth: 32.
	rc := JunUFFIOpenGLRenderingContext on: form.
	xarrow := Array
		with: 0 _, 0 _, 0
		with: 1.5 _, 0 _, 0
		with: 1.4 _, 0.01 _, 0.01
		with: 1.4 _, -0.01 _, -0.01.
	yarrow := Array
		with: 0 _, 0 _, 0
		with: 0 _, 1.5 _, 0
		with: 0.01 _, 1.4 _, 0.01
		with: -0.01 _, 1.4 _, -0.01.
	zarrow := Array
		with: 0 _, 0 _, 0
		with: 0 _, 0 _, 1.5
		with: 0.01 _, 0.01 _, 1.4
		with: -0.01 _, -0.01 _, 1.4.
	floorPoints := Array
		with: 0 _, 0 _, 1
		with: 1 _, 0 _, 1
		with: 1 _, 1 _, 1
		with: 0 _, 1 _, 1.
	ceilPoints := Array
		with: 0 _, 1 _, 0
		with: 1 _, 1 _, 0
		with: 1 _, 0 _, 0
		with: 0 _, 0 _, 0.
	leftPoints := Array
		with: 1 _, 0 _, 0
		with: 1 _, 1 _, 0
		with: 1 _, 1 _, 1
		with: 1 _, 0 _, 1.
	rightPoints := Array
		with: 0 _, 0 _, 1
		with: 0 _, 1 _, 1
		with: 0 _, 1 _, 0
		with: 0 _, 0 _, 0.
	nearPoints := Array
		with: 0 _, 1 _, 1
		with: 1 _, 1 _, 1
		with: 1 _, 1 _, 0
		with: 0 _, 1 _, 0.
	farPoints := Array
		with: 0 _, 0 _, 0
		with: 1 _, 0 _, 0
		with: 1 _, 0 _, 1
		with: 0 _, 0 _, 1.
	rc disableCullface.
	angle := 0 asDegrees.
	projection := JunPerspectiveProjection
		eyePoint: 3 _, 3 _, 3
		sightPoint: 0 _, 0 _, 0
		upVector: 0 _, 0 _, 1
		fovy: 30 asDegrees
		near: 0.1
		far: 100.0.
	rc projection: projection.
	rc enableCullface.
	rc clear.
	rc ambientLight: Color darkGray.
	rc lightIndex: 0 parallel: 1 _, 2 _, 3 color: Color white.
	rc color: Color red.
	rc displayPolygon: floorPoints.
	rc color: Color blue.
	rc displayPolygon: ceilPoints.
	rc color: Color green.
	rc displayPolygon: leftPoints.
	rc color: Color yellow.
	rc displayPolygon: rightPoints.
	rc color: Color magenta.
	rc displayPolygon: nearPoints.
	rc color: Color purple.
	rc displayPolygon: farPoints.
	rc flush.
	form asMorph openInWindow