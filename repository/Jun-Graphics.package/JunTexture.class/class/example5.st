examples
example5
	"JunTexture example5"

	| earth moon spin dist rc morph process |
	earth := Jun3dDisplayObject earth: 10.
	earth := earth transform: (Jun3dTransformation scale: 6.371).
	moon := Jun3dDisplayObject moon: 10.
	moon := moon transform: (Jun3dTransformation scale: 1.737).
	moon := moon transform: (Jun3dTransformation translate: 337.862 _, 0 _, 184.591).
	spin := Jun3dTransformation rotateZ: 1 asDegrees.
	dist := 800.0.
	rc := (Form extent: World extent depth: 32) renderingContext.
	rc backgroundColor: (Color white alpha: 0.0).
	morph := rc form asMorph.
	morph borderColor: Color gray.
	morph borderWidth: 0.
	morph center: World center.
	morph openInWorld.
	rc disableCullface.
	process := [ [ | projection |
	projection := JunPerspectiveProjection
		eyePoint: (0.8788091044555351 _, 0.010043532622348972 _, 0.4770677995615762) * dist
		sightPoint: 0 _, 0 _, 0
		upVector: 0 _, 0 _, 1
		fovy: 20 asDegrees
		near: 0.1
		far: 10000.0.
	rc projection: projection.
	rc clear.
	rc ambientLight: Color gray.
	rc lightIndex: 0 parallel: projection eyePoint negated color: Color gray.
	earth renderOn: rc.
	moon renderOn: rc.
	earth := earth transform: spin.
	dist := dist - 2.0 max: 100.0.
	rc flush.
	morph changed.
	(Delay forMilliseconds: 10) wait ] repeat ] forkAt: Processor userBackgroundPriority.
	morph
		on: #click
		send: #value
		to: [ process terminate.
			morph delete ]