examples
example5
	"JunUFFIOpenGLRenderingContext example5"

	| benzene rc morph angle process |
	benzene := Jun3dDisplayObject benzene.
	rc := (Form extent: 500 @ 500 depth: 32) renderingContext.
	rc backgroundColor: (Color white alpha: 0.0).
	morph := rc form asMorph.
	morph borderColor: Color gray.
	morph borderWidth: 3.
	morph center: World center.
	morph openInWorld.
	angle := 0 asDegrees.
	rc enableCullface.
	process := [ [ | projection |
	projection := JunPerspectiveProjection
		eyePoint: ((Jun2dPoint rho: 1 theta: angle) _, angle cos) unitVector * 15
		sightPoint: 0 _, 0 _, 0
		upVector: 0 _, 0 _, 1
		fovy: 30 asDegrees
		near: 0.1
		far: 100.0.
	angle := (angle + 5 asDegrees) uniformed.
	rc projection: projection.
	rc clear.
	rc ambientLight: Color gray.
	rc lightIndex: 0 parallel: projection eyePoint negated color: Color gray.
	benzene renderOn: rc.
	rc flush.
	morph changed.
	(Delay forMilliseconds: 100) wait ] repeat ] forkAt: Processor userBackgroundPriority.
	morph
		on: #click
		send: #value
		to: [ process terminate.
			morph delete ]