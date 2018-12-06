examples
example3
	"JunTexture example3"

	| texture sphere rc morph angle1 angle2 process form |
	texture := JunTexture
		on: ((Form fromDisplay: (0 @ 0 extent: World extent)) scaledToSize: 500 @ 500).
	sphere := Jun3dDisplayCompoundObject new.
	0 to: 180 - 1 by: 10 do: [ :latitude | 
		0 to: 360 - 1 by: 10 do: [ :longitude | 
			| polygon |
			polygon := Jun3dDisplayPolygon
				points:
					(Array
						with: (Jun3dPoint rho: 2.0 phi: longitude asDegrees theta: latitude asDegrees)
						with: (Jun3dPoint rho: 2.0 phi: (longitude + 10) asDegrees theta: latitude asDegrees)
						with: (Jun3dPoint rho: 2.0 phi: (longitude + 10) asDegrees theta: (latitude + 10) asDegrees)
						with: (Jun3dPoint rho: 2.0 phi: longitude asDegrees theta: (latitude + 10) asDegrees)).
			polygon
				setTexture: texture
				points:
					(Array
						with: longitude / 360.0 _, (latitude / 180.0)
						with: (longitude + 10) / 360.0 _, (latitude / 180.0)
						with: (longitude + 10) / 360.0 _, ((latitude + 10) / 180.0)
						with: longitude / 360.0 _, ((latitude + 10) / 180.0)).
			sphere add: polygon ] ].
	form := Form extent: 500 @ 500 depth: 32.
	rc := form renderingContext.
	rc backgroundColor: (Color white alpha: 0.0).
	morph := form asMorph.
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
	sphere renderOn: rc.
	rc flush.
	morph changed.
	(Delay forMilliseconds: 10) wait ] repeat ] forkAt: Processor userBackgroundPriority.
	morph
		on: #click
		send: #value
		to: [ process terminate.
			morph delete ]