"
A JunLauncher is a menu window to launch example applications.

"
Class {
	#name : #JunLauncher,
	#superclass : #Morph,
	#category : 'Jun-System-Launcher'
}

{ #category : #'class access' }
JunLauncher class >> defaultSystemClass [
	^ JunSystem
]

{ #category : #'class initialization' }
JunLauncher class >> initialize [
	self install
]

{ #category : #'class initialization' }
JunLauncher class >> install [
	self reopen
]

{ #category : #'instance creation' }
JunLauncher class >> open [
	"JunLauncher open"

	^ self new openInWindow
]

{ #category : #'instance creation' }
JunLauncher class >> reopen [
	"JunLauncher reopen"

	World allMorphs
		do: [ :m | 
			m class = self
				ifTrue: [ 
					| owner |
					owner := m owner.
					[ owner isNil or: [ owner isKindOf: SystemWindow ] ] whileFalse: [ owner := owner owner ].
					owner ifNotNil: [ owner delete ] ] ].
	self open
]

{ #category : #examples }
JunLauncher >> exampleBouncingBalls [
	| lines random balls velocities colors t form offset morph process |
	lines := OrderedCollection new.
	lines add: (Array with: 0 _, 0 _, 0 with: 10 _, 0 _, 0).
	lines add: (Array with: 10 _, 0 _, 0 with: 10 _, 10 _, 0).
	lines add: (Array with: 10 _, 10 _, 0 with: 0 _, 10 _, 0).
	lines add: (Array with: 0 _, 10 _, 0 with: 0 _, 0 _, 0).
	lines add: (Array with: 0 _, 0 _, 0 with: 0 _, 0 _, 10).
	lines add: (Array with: 10 _, 0 _, 0 with: 10 _, 0 _, 10).
	lines add: (Array with: 10 _, 10 _, 0 with: 10 _, 10 _, 10).
	lines add: (Array with: 0 _, 10 _, 0 with: 0 _, 10 _, 10).
	lines add: (Array with: 0 _, 0 _, 10 with: 10 _, 0 _, 10).
	lines add: (Array with: 10 _, 0 _, 10 with: 10 _, 10 _, 10).
	lines add: (Array with: 10 _, 10 _, 10 with: 0 _, 10 _, 10).
	lines add: (Array with: 0 _, 10 _, 10 with: 0 _, 0 _, 10).
	random := Random new.
	balls := (1 to: 50) collect: [ :i | (random next _, random next _, random next) * 10.0 ].
	velocities := balls collect: [ :p | (random next _, random next _, random next) * 0.1 ].
	colors := balls collect: [ :p | Color random ].
	t := ((Jun3dTransformation perspective: 5 _, 5 _, 12) product: (Jun3dTransformation translate: -5 _, -5 _, 0))
		product: (Jun3dTransformation scale: 1.5).
	form := Form extent: 400 @ 400 depth: 32.
	offset := form extent // 2.
	morph := form asMorph.
	morph borderColor: Color gray.
	morph borderWidth: 3.
	morph center: World center.
	morph openInWorld.
	process := [ 
	form getCanvas
		in: [ :canvas | 
			[ 
			| ps inds |
			canvas fillColor: Color white.
			lines
				do: [ :line | 
					canvas
						line: (line first transform: t) asPoint * 10 + offset
						to: (line last transform: t) asPoint * 10 + offset
						color: Color black ].
			ps := balls collect: [ :p | p transform: t ].
			inds := (1 to: ps size) asSortedCollection: [ :i1 :i2 | (ps at: i1) z <= (ps at: i2) z ].
			inds
				do: [ :i | 
					| p z |
					p := ps at: i.
					z := p z abs * 2.
					canvas fillOval: (p asPoint * 10 - z + offset extent: (z * 2) asPoint) color: (colors at: i).
					balls at: i put: (balls at: i) + (velocities at: i).
					((balls at: i) x between: 0 and: 10)
						ifFalse: [ velocities at: i put: (velocities at: i) * (-1 _, 1 _, 1) ].
					((balls at: i) y between: 0 and: 10)
						ifFalse: [ velocities at: i put: (velocities at: i) * (1 _, -1 _, 1) ].
					((balls at: i) z between: 0 and: 10)
						ifFalse: [ velocities at: i put: (velocities at: i) * (1 _, 1 _, -1) ] ].
			canvas flush.
			morph changed.
			10 milliSecond wait ] repeat ] ] forkAt: Processor userBackgroundPriority.
	morph
		on: #click
		send: #value
		to: [ 
			process terminate.
			morph delete ]
]

{ #category : #examples }
JunLauncher >> exampleCanvasHiddenlineRendering [
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
	rc hiddenlinePresentation.
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
]

{ #category : #examples }
JunLauncher >> exampleCanvasRendering [
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
	rc displayLines: xarrow.
	rc displayLines: yarrow.
	rc displayLines: zarrow.
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
]

{ #category : #examples }
JunLauncher >> exampleCanvasWireframeRendering [
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
]

{ #category : #examples }
JunLauncher >> exampleFakeRaytracing [
	| sphere1 sphere2 eyePoint random form offset morph |
	sphere1 := JunSphereSurface unity.
	sphere2 := JunSphereSurface center: 0.4 _, 0.3 _, 0.5 radius: 0.7.
	eyePoint := 0 _, 0 _, 10.
	random := Random new.
	form := Form extent: 400 @ 400 depth: 32.
	form getCanvas fillColor: Color black.
	offset := form extent // 2.
	form getCanvas
		in: [ :canvas | 
			-1.0 to: 1.0 by: 200.0 reciprocal do: [ :dy | 
				-1.0 to: 1.0 by: 200.0 reciprocal do: [ :dx | 
					| sight |
					sight := Jun3dLine from: eyePoint to: (dx asRadians sin * 2) _, (dy asRadians sin * 2)_, 0.0.
					((sphere1 crossPointsWithLine: sight) collect: [ :p | sphere1 -> p ])
						_, ((sphere2 crossPointsWithLine: sight) collect: [ :p | sphere2 -> p ])
						ifNotEmpty: [ :ts | 
							(ts asSortedCollection: [ :shallow :deep | shallow value z >= deep value z ]) first
								in: [ :assoc | 
									| point sphere c x y |
									point := assoc value.
									sphere := assoc key.
									c := sphere == sphere1
										ifTrue: [ (Color h: 240 s: 0.5 v: 1.0) mixed: point z abs with: (Color h: 240 s: 1 v: 0.0) ]
										ifFalse: [ (Color h: 60 s: 0.5 v: 1.0) mixed: ((point z - sphere2 center z) / sphere2 radius) abs with: (Color h: 60 s: 1 v: 0.0) ].
									x := (dx + 1) * 200.
									y := (dy + 1) * 200.
									canvas fillRectangle: (x @ y extent: 1 @ 1) color: c ] ] ] ] ].
	morph := form asMorph.
	morph borderColor: Color gray.
	morph borderWidth: 3.
	morph center: World center.
	morph openInWorld.
	morph on: #click send: #value to: [ morph delete ]
]

{ #category : #examples }
JunLauncher >> exampleRotatingBouncingBalls [
	| lines random balls velocities colors perspective rotation omega form offset morph process |
	lines := OrderedCollection new.
	lines add: (Array with: 0 _, 0 _, 0 with: 10 _, 0 _, 0).
	lines add: (Array with: 10 _, 0 _, 0 with: 10 _, 10 _, 0).
	lines add: (Array with: 10 _, 10 _, 0 with: 0 _, 10 _, 0).
	lines add: (Array with: 0 _, 10 _, 0 with: 0 _, 0 _, 0).
	lines add: (Array with: 0 _, 0 _, 0 with: 0 _, 0 _, 10).
	lines add: (Array with: 10 _, 0 _, 0 with: 10 _, 0 _, 10).
	lines add: (Array with: 10 _, 10 _, 0 with: 10 _, 10 _, 10).
	lines add: (Array with: 0 _, 10 _, 0 with: 0 _, 10 _, 10).
	lines add: (Array with: 0 _, 0 _, 10 with: 10 _, 0 _, 10).
	lines add: (Array with: 10 _, 0 _, 10 with: 10 _, 10 _, 10).
	lines add: (Array with: 10 _, 10 _, 10 with: 0 _, 10 _, 10).
	lines add: (Array with: 0 _, 10 _, 10 with: 0 _, 0 _, 10).
	random := Random new.
	balls := (1 to: 100) collect: [ :i | (random next _, random next _, random next) * 10.0 ].
	velocities := balls collect: [ :p | (random next _, random next _, random next) * 0.1 ].
	colors := balls collect: [ :p | Color random ].
	perspective := ((Jun3dTransformation perspective: 5_, 5_, 40) product: (Jun3dTransformation translate: -5_, -5_, 0))  product: (Jun3dTransformation scale:  2).
	rotation := Jun3dTransformation unity.
	omega := (((Jun3dTransformation translate: -5_, -5_, -5) product: (Jun3dTransformation rotateX: 1 asDegrees))  product: (Jun3dTransformation rotateY: 2 asDegrees)) product: (Jun3dTransformation translate: 5_, 5_, 5).
	form := Form extent: 400 @ 400 depth: 32.
	offset := form extent // 2.
	morph := form asMorph.
	morph borderColor: Color gray.
	morph borderWidth: 3.
	morph center: World center.
	morph openInWorld.
	process := [ 
	form getCanvas
		in: [ :canvas | 
			[ 
			| t ps inds |
			t := rotation product: perspective.
			rotation := rotation product: omega.
			canvas fillColor: Color white.
			lines
				do: [ :line | 
					canvas
						line: (line first transform: t) asPoint * 10 + offset
						to: (line last transform: t) asPoint * 10 + offset
						color: Color black ].
			ps := balls collect: [ :p | p transform: t ].
			inds := (1 to: ps size) asSortedCollection: [ :i1 :i2 | (ps at: i1) z <= (ps at: i2) z ].
			inds
				do: [ :i | 
					| p z |
					p := ps at: i.
					z := p z abs * 5.
					canvas fillOval: (p asPoint * 10 - z + offset extent: (z * 2) asPoint) color: (colors at: i).
					balls at: i put: (balls at: i) + (velocities at: i).
					((balls at: i) x between: 0 and: 10)
						ifFalse: [ velocities at: i put: (velocities at: i) * (-1 _, 1 _, 1) ].
					((balls at: i) y between: 0 and: 10)
						ifFalse: [ velocities at: i put: (velocities at: i) * (1 _, -1 _, 1) ].
					((balls at: i) z between: 0 and: 10)
						ifFalse: [ velocities at: i put: (velocities at: i) * (1 _, 1 _, -1) ] ].
			canvas flush.
			morph changed.
			10 milliSecond wait ] repeat ] ] forkAt: Processor userBackgroundPriority.
	morph
		on: #click
		send: #value
		to: [ 
			process terminate.
			morph delete ]
]

{ #category : #examples }
JunLauncher >> exampleSphereSurface [
	| sphere random projection form offset morph process |
	sphere := JunSphereSurface unity.
	random := Random new.
	projection := Jun3dTransformation perspective: 1_, 3_, 10.
	form := Form extent: 400 @ 400 depth: 32.
	form getCanvas fillColor: Color black.
	offset := form extent // 2.
	morph := form asMorph.
	morph borderColor: Color gray.
	morph borderWidth: 3.
	morph center: World center.
	morph openInWorld.
	process := [ 
	[ 
	form getCanvas
		in: [ :canvas | 
			| line |
			"line :=  random next * 2 - 1_, (random next * 2 - 1)_, 2 to: random next * 2 - 1_, (random next * 2 - 1)_, -2."
			line := random next * 2 - 1 _, (random next * 2 - 1) _, 1 to: 0 _, 0 _, 0.
			(sphere crossPointsWithLine: line)
				do: [ :point | 
					(point transform: projection)
						in: [ :p | 
							| z n |
							z := p z abs * 2 max: 0.5.
							n := p unitVector z negated.
							n > 0
								ifTrue: [ canvas fillOval: (p asPoint * 200 - z + offset extent: (z * 2) asPoint) color: (Color gray: (n + 0.2 min: 1.0)) ] ] ] ].
	morph changed ] repeat ] forkAt: Processor userBackgroundPriority.
	morph
		on: #click
		send: #value
		to: [ 
			process terminate.
			morph delete ]
]

{ #category : #menus }
JunLauncher >> examplesMenu [
	| menu |
	menu := MenuMorph new
		defaultTarget: self;
		add: 'geometries...'
			subMenu:
			(MenuMorph new
				add: 'bouncing balls' translated target: self selector: #exampleBouncingBalls;
				add: 'rotating bouncing balls' translated
					target: self
					selector: #exampleRotatingBouncingBalls;
				addLine;
				add: 'sphere surface' translated target: self selector: #exampleSphereSurface;
				add: 'fake raytracing' translated target: self selector: #exampleFakeRaytracing;
				yourself);
		add: 'rendering contexts...'
			subMenu:
			(MenuMorph new
				add: 'canvas rendering' target: self selector: #exampleCanvasRendering;
				add: 'canvas hiddenline rendering'
					target: self
					selector: #exampleCanvasHiddenlineRendering;
				add: 'canvas wireframe rendering'
					target: self
					selector: #exampleCanvasWireframeRendering;
				yourself);
		yourself.
	Smalltalk
		at: #JunNBGLRenderingContext
		ifPresent: [ :glRenderingContextClass | 
			menu
				add: 'NativeBoost OpenGL...'
				subMenu:
					(MenuMorph new
						add: 'benzene image' target: glRenderingContextClass selector: #example3;
						add: 'benzene movie' target: glRenderingContextClass selector: #example4;
						add: 'benzene movie2' target: glRenderingContextClass selector: #example5;
						yourself) ].
	Smalltalk
		at: #JunUFFIOpenGLRenderingContext
		ifPresent: [ :glRenderingContextClass | 
			menu
				add: 'UFFI OpenGL...'
				subMenu:
					(MenuMorph new
						add: 'benzene image' target: glRenderingContextClass selector: #example3;
						add: 'benzene movie' target: glRenderingContextClass selector: #example4;
						add: 'benzene movie2' target: glRenderingContextClass selector: #example5;
						yourself) ].
	Smalltalk
		at: #JunTexture
		ifPresent: [ :textureClass | 
			menu
				add: 'textures...'
				subMenu:
					(MenuMorph new
						add: 'texture: jun logo' target: textureClass selector: #example1;
						add: 'texture: flat world' target: textureClass selector: #example2;
						add: 'texture: spherical world' target: textureClass selector: #example3;
						add: 'texture: earth' target: textureClass selector: #example4;
						add: 'texture: moon' target: textureClass selector: #example6;
						add: 'texture: earth and moon' target: textureClass selector: #example5;
						yourself) ].
	menu
		add: 'viewer...'
		subMenu:
			(MenuMorph new
				add: 'cube' target: JunSimple3dMorph selector: #exampleCube;
				add: 'earth' target: JunSimple3dMorph selector: #exampleEarth;
				yourself).
	Smalltalk
		at: #JunMoleculeGeometry
		ifPresent: [ :moleculeClass | 
			menu
				add: 'chemistry'
				subMenu:
					(MenuMorph new
						add: 'methane' target: moleculeClass selector: #example1;
						add: 'methane(anim)' target: moleculeClass selector: #example3;
						add: 'T3' target: moleculeClass selector: #example4;
						add: 'T3(anim)' target: moleculeClass selector: #exampleT3anim;
						yourself) ].
	Smalltalk
		at: #JunWodenSimpleExample
		ifPresent: [ :wodenClass | 
			menu
				add: 'woden interface...'
				subMenu:
					(MenuMorph new
						add: 'benzene woden' target: wodenClass selector: #open;
						yourself) ].
	Smalltalk
		at: #HGSimulator
		ifPresent: [ :simulatorClass | 
			menu
				add: 'honey ginger'
				subMenu:
					(MenuMorph new
						add: 'submarine (OpenGL)' target: simulatorClass selector: #submarineByJun4Pharo;
						add: 'submarine (Canvas)' target: simulatorClass selector: #submarineByJun4Pharo2;
						yourself) ].
	^ menu popUpInWorld
]

{ #category : #'interface building' }
JunLauncher >> logo [
	"JunLauncher new logo openInWindow"

	| image width height |
	image := self class defaultSystemClass logoImage.
	image width > image height
		ifTrue: [ 
			width := (image width * (175 / image width)) rounded.
			height := (image height * (175 / image width)) rounded ]
		ifFalse: [ 
			width := (image width * (175 / image height)) rounded.
			height := (image height * (175 / image height)) rounded ].
	image := image scaledToSize: width @ height.
	^ (Form extent: image extent + (20 @ 0) depth: 32)
		in: [ :form | 
			form getCanvas
				in: [ :canvas | 
					canvas fillColor: Color white.
					canvas paintImage: image at: (form extent - image extent) // 2.
					canvas flush ].
			form asMorph
				borderColor: Color black;
				borderWidth: 1;
				yourself ]
]

{ #category : #'interface building' }
JunLauncher >> menuBar [
	| toolsMenu examplesMenu menuBar |
	toolsMenu := ' Tools ' asMorph.
	toolsMenu on: #click send: #toolsMenu to: self.
	examplesMenu := ' Examples ' asMorph.
	examplesMenu on: #click send: #examplesMenu to: self.
	menuBar := Morph new.
	menuBar color: Color transparent.
	menuBar extent: (toolsMenu width + examplesMenu width) @ (toolsMenu height max: examplesMenu height).
	menuBar
		changeTableLayout;
		listDirection: #leftToRight.
	menuBar addMorphBack: toolsMenu.
	menuBar addMorphBack: examplesMenu.
	^ menuBar
]

{ #category : #'interface building' }
JunLauncher >> openInWindow [
	"JunLauncher new openInWindow"

	| menuBar logo |
	menuBar := self menuBar.
	logo := self logo.
	self color: Color white.
	self extent: (logo width max: menuBar width) @ (logo height + menuBar height).
	self changeProportionalLayout.
	self
		addMorph: menuBar
		fullFrame: ((0 @ 0 corner: 1 @ 0) asLayoutFrame bottomRightOffset: (0 @ menuBar height)).
	self
		addMorph: logo
		fullFrame: ((0 @ 0 corner: 1 @ 1) asLayoutFrame topLeftOffset:  (0 @ menuBar height)).
	^ (self openInWindowLabeled: self class asString)
		beUnresizeable;
		yourself
]

{ #category : #menus }
JunLauncher >> toolsMenu [
	| menu |
	menu := MenuMorph new defaultTarget: self.
	menu add: 'reopen launcher' translated target: self class selector: #reopen.
	^ menu popUpInWorld
]
