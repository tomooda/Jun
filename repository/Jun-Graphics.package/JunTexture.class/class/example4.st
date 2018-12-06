examples
example4
	"JunTexture example4"

	| sphere rc morph angle1 angle2 dist process |
	sphere := Jun3dDisplayObject earth: 10.
	rc := (Form extent: 500 @ 500 depth: 32) renderingContext.
	rc backgroundColor: (Color white alpha: 0.0).
	morph := rc form asMorph.
	morph borderColor: Color gray.
	morph borderWidth: 0.
	morph center: World center.
	morph openInWorld.
	angle1 := 0 asDegrees.
	angle2 := 0 asDegrees.
	dist := 40.0.
	rc disableCullface.
	process := [ [ | projection |
	projection := JunPerspectiveProjection
		eyePoint: ((Jun2dPoint rho: 1 theta: angle1) _, angle2 cos) unitVector * dist
		sightPoint: 0 _, 0 _, 0
		upVector: 0 _, 0 _, 1
		fovy: 30 asDegrees
		near: 0.1
		far: 100.0.
	angle1 := (angle1 + 2 asDegrees) uniformed.
	angle2 := (angle2 + 0.2 asDegrees) uniformed.
	dist > 10.0
		ifTrue: [ dist := dist - 0.1 ].
	rc projection: projection.
	rc clear.
	rc ambientLight: Color gray.
	rc lightIndex: 0 parallel: projection eyePoint negated color: Color gray.
	sphere renderOn: rc.
	rc flush.
	morph changed.
	(Delay forMilliseconds: 10) wait ] repeat ] forkAt: Processor userBackgroundPriority.
	morph
		on: #click
		send: #value
		to: [ process terminate.
			morph delete ]