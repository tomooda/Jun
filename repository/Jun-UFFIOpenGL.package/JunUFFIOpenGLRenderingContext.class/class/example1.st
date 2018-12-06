examples
example1
	"JunUFFIOpenGLRenderingContext  example1"

	| rc floorPoints ceilPoints leftPoints rightPoints nearPoints farPoints projection form |
	form := Form extent: 500 @ 500 depth: 32.
	rc := JunUFFIOpenGLRenderingContext on: form.
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
	projection := JunParallelProjection
		eyePoint: 10 _, 10 _, 10
		sightPoint: 0 _, 0 _, 0
		upVector: 0 _, 0 _, 1
		height: 3.0
		near: 0.0001
		far: 100.0.
	rc backgroundColor: Color lightGray.
	rc projection: projection.
	rc disableCullface.
	rc clear.
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
	form asMorph openInWindow.
	^ rc