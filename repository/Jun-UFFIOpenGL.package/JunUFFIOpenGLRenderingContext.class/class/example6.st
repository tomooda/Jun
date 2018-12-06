examples
example6
	"JunUFFIOpenGLRenderingContext example6"

	| square rc morph angle process |
	square := Jun3dDisplayPolygon points: (Array with: -2_, -2_, 0 with: 2_, -2_, 0 with: 2_, 2_, 0 with: -2_, 2_, 0).
	square setTexture: (JunTexture on: JunSystem logo ) points: (Array with: 0_, 1 with: 1_, 1 with: 1_, 0 with: 0_, 0).
	rc := (Form extent: 500@500 depth: 32) renderingContext.
	rc backgroundColor: (Color white alpha: 0.0).
	morph := rc form asMorph.
	morph borderColor: Color gray.
	morph borderWidth: 3.
	morph center: World center.
	morph openInWorld.
	angle := 0 asDegrees.
	rc disableCullface.
	process := [ 
	[ | projection |
	projection := JunPerspectiveProjection
		eyePoint: ((Jun2dPoint rho: 1 theta: angle)_, angle cos) unitVector * 15
		sightPoint: 0 _, 0 _, 0
		upVector: 0 _, 0_, 1
		fovy: 30 asDegrees
		near: 0.1
		far: 100.0.
	angle := (angle + 5 asDegrees) uniformed.
	rc projection: projection.
	rc clear.
	rc ambientLight: Color gray.
	rc lightIndex: 0 parallel: (projection eyePoint) negated color: Color gray.
	square renderOn: rc.
	rc flush.
	morph changed.
	(Delay forMilliseconds: 100) wait] repeat] forkAt: Processor userBackgroundPriority.
	morph
		on: #click
		send: #value
		to: [ 
			process terminate.
			morph delete ]