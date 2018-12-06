menus
examplesMenu
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