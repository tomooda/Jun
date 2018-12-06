examples
exampleCanvasWireframeRendering
	| xarrow yarrow zarrow floorPoints ceilPoints leftPoints rightPoints nearPoints farPoints form morph process projection angle rc |
	xarrow := Array with: 0_, 0_, 0 with: 1.5_, 0_, 0 with: 1.4_, 0.01_, 0.01 with: 1.4_, -0.01_, -0.01.
	yarrow := Array with: 0_, 0_, 0 with: 0_, 1.5_, 0 with: 0.01_, 1.4_, 0.01 with: -0.01_, 1.4_, -0.01.
	zarrow := Array with: 0_, 0_, 0 with: 0_, 0_, 1.5 with: 0.01_, 0.01_, 1.4 with: -0.01_, -0.01_, 1.4.
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
	form := Form extent: 400 @ 400 depth: 32.
	morph := form asMorph.
	morph borderColor: Color gray.
	morph borderWidth: 3.
	morph center: World center.
	morph openInWorld.
	rc := form canvasRenderingContext.
	rc enableCullface.
	rc wireframePresentation.
	angle := 0 asDegrees.
	process := [ 
	[ 
	form getCanvas fillColor: Color white.
	projection := JunPerspectiveProjection
		eyePoint: ((Jun2dPoint rho: 2 theta: angle)_, angle cos) unitVector * 3
		sightPoint: Jun3dPoint zero
		upVector: 0 _, 0 _, 1
		fovy: 60 asDegrees
		near: 0.00001
		far: 100.0.
	angle := (angle + 5 asDegrees) uniformed.
	rc projection: projection.
	rc clear.
	rc color: Color black.
	rc lineWidth: 1.
	rc displayLines: xarrow.
	rc displayLines: yarrow.
	rc displayLines: zarrow.
	rc lineWidth: 5.
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
	morph changed.
	(Delay forMilliseconds: 100) wait ] repeat ] forkAt: Processor userBackgroundPriority.
	morph
		on: #click
		send: #value
		to: [ 
			process terminate.
			morph delete ]