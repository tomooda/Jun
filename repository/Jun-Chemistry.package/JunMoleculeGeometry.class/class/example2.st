examples
example2
	"JunMoleculeGeometry example2"

	| molecule form morph angle process |
	molecule := JunMoleculeGeometry exampleMethane.
	form := Form extent: 500 @ 500 depth: 32.
	morph := form asMorph.
	morph borderColor: Color gray.
	morph borderWidth: 3.
	morph center: World center.
	morph openInWorld.
	angle := 0 asDegrees.
	process := [ 
	[ 
	| projection |
	projection := JunParallelProjection
		eyePoint: ((Jun2dPoint rho: 1 theta: angle) _, angle cos) unitVector * 15
		sightPoint: 0 _, 0 _, 0
		upVector: 0 _, 0 _, 1
		height: 2.0
		near: 0.1
		far: 100.0.
	angle := (angle + 10 asDegrees) uniformed.
	form getCanvas
		in: [ :canvas | 
			canvas fillColor: Color white.
			(molecule transform: projection asTransformation)
				drawOn: canvas
				at: form extent / 2.0
				scale: form extent / 4.0
				radius: 40
				borderWidth: 1
				borderColor: Color black.
			canvas flush ].
	morph changed.
	(Delay forMilliseconds: 100) wait ] repeat ] forkAt: Processor userBackgroundPriority.
	morph
		on: #click
		send: #value
		to: [ 
			process terminate.
			morph delete ]