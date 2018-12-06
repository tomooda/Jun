examples
example1
	"JunTexture example1"

	| square rc morph angle1 angle2 process |
	square := Jun3dDisplayPolygon
		points:
			(Array
				with: -2 _, 0 _, -2
				with: 2 _, 0 _, -2
				with: 2 _, 0 _, 2
				with: -2 _, 0 _, 2).
	square
		setTexture: (JunTexture on: JunSystem logo)
		points:
			(Array
				with: 0 _, 1
				with: 1 _, 1
				with: 1 _, 0
				with: 0 _, 0).
	rc := (Form extent: 500 @ 500 depth: 32) renderingContext.
	rc backgroundColor: (Color white alpha: 0.0).
	morph := rc form asMorph.
	morph borderColor: Color gray.
	morph borderWidth: 0.
	morph center: World center.
	morph openInWorld.
	angle1 := 0 asDegrees.
	angle2 := 0 asDegrees.
	rc disableCullface.
	process := [ [ | projection |
	projection := JunPerspectiveProjection
		eyePoint: ((Jun2dPoint rho: 1 theta: angle1) _, angle2 cos) unitVector * 10
		sightPoint: 0 _, 0 _, 0
		upVector: 0 _, 0 _, 1
		fovy: 30 asDegrees
		near: 0.1
		far: 100.0.
	angle1 := (angle1 + 5 asDegrees) uniformed.
	angle2 := (angle2 + 1 asDegrees) uniformed.
	rc projection: projection.
	rc clear.
	rc ambientLight: Color gray.
	rc lightIndex: 0 parallel: projection eyePoint negated color: Color gray.
	square renderOn: rc.
	rc flush.
	morph changed.
	(Delay forMilliseconds: 10) wait ] repeat ] forkAt: Processor userBackgroundPriority.
	morph
		on: #click
		send: #value
		to: [ process terminate.
			morph delete ]