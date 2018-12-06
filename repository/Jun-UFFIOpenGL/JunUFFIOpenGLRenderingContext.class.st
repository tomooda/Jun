Class {
	#name : #JunUFFIOpenGLRenderingContext,
	#superclass : #JunAbstractRenderingContext,
	#instVars : [
		'context',
		'frameBuffer',
		'forms',
		'textures'
	],
	#classVars : [
		'Cache',
		'CacheLock',
		'GL'
	],
	#pools : [
		'UFFIOpenGLConstants'
	],
	#category : 'Jun-UFFIOpenGL'
}

{ #category : #cache }
JunUFFIOpenGLRenderingContext class >> cache [
	^ Cache ifNil: [ Cache := OrderedCollection new ]
]

{ #category : #cache }
JunUFFIOpenGLRenderingContext class >> cacheLock: aBlock [
	(CacheLock ifNil: [ CacheLock := Semaphore forMutualExclusion ]) critical: aBlock
]

{ #category : #examples }
JunUFFIOpenGLRenderingContext class >> example0 [
	"JunUFFIOpenGLRenderingContext example0"

	| rc form |
	form := Form extent: 500 @ 500 depth: 32.
	rc := JunUFFIOpenGLRenderingContext on: form.
	rc backgroundColor: Color blue.
	rc clear.
	rc flush.
	rc form asMorph openInWindow
]

{ #category : #examples }
JunUFFIOpenGLRenderingContext class >> example1 [
	"JunUFFIOpenGLRenderingContext  example1"

	| rc floorPoints ceilPoints leftPoints rightPoints nearPoints farPoints projection form |
	form := Form extent: 500 @ 500 depth: 32.
	rc := JunUFFIOpenGLRenderingContext on: form.
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
	projection := JunParallelProjection
		eyePoint: 10 _, 10 _, 10
		sightPoint: 0 _, 0 _, 0
		upVector: 0 _, 0 _, 1
		height: 3.0
		near: 0.0001
		far: 100.0.
	rc backgroundColor: Color lightGray.
	rc projection: projection.
	rc disableCullface.
	rc clear.
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
	form asMorph openInWindow.
	^ rc
]

{ #category : #examples }
JunUFFIOpenGLRenderingContext class >> example2 [
	"JunUFFIOpenGLRenderingContext example2"

	| rc xarrow yarrow zarrow floorPoints ceilPoints leftPoints rightPoints nearPoints farPoints projection angle form |
	form := Form extent: 500 @ 500 depth: 32.
	rc := JunUFFIOpenGLRenderingContext on: form.
	xarrow := Array
		with: 0 _, 0 _, 0
		with: 1.5 _, 0 _, 0
		with: 1.4 _, 0.01 _, 0.01
		with: 1.4 _, -0.01 _, -0.01.
	yarrow := Array
		with: 0 _, 0 _, 0
		with: 0 _, 1.5 _, 0
		with: 0.01 _, 1.4 _, 0.01
		with: -0.01 _, 1.4 _, -0.01.
	zarrow := Array
		with: 0 _, 0 _, 0
		with: 0 _, 0 _, 1.5
		with: 0.01 _, 0.01 _, 1.4
		with: -0.01 _, -0.01 _, 1.4.
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
	rc disableCullface.
	angle := 0 asDegrees.
	projection := JunPerspectiveProjection
		eyePoint: 3 _, 3 _, 3
		sightPoint: 0 _, 0 _, 0
		upVector: 0 _, 0 _, 1
		fovy: 30 asDegrees
		near: 0.1
		far: 100.0.
	rc projection: projection.
	rc enableCullface.
	rc clear.
	rc ambientLight: Color darkGray.
	rc lightIndex: 0 parallel: 1 _, 2 _, 3 color: Color white.
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
	form asMorph openInWindow
]

{ #category : #examples }
JunUFFIOpenGLRenderingContext class >> example3 [
	"JunUFFIOpenGLRenderingContext example3"

	| rc projection form |
	form := Form extent: 500 @ 500 depth: 32.
	rc := JunUFFIOpenGLRenderingContext on: form.
	projection := JunPerspectiveProjection
		eyePoint: 10 _, 10 _, 15
		sightPoint: 0 _, 0 _, 0
		upVector: 0 _, 1 _, 0
		fovy: 30 asDegrees
		near: 0.1
		far: 100.0.
	rc projection: projection.
	rc enableCullface.
	rc clear.
	rc ambientLight: Color darkGray.
	rc lightIndex: 0 parallel: (10 _, 10 _, 15) negated color: Color white.
	Jun3dDisplayObject benzene renderOn: rc.
	rc flush.
	(Delay forMilliseconds: 100) wait.
	form asMorph openInWindow
]

{ #category : #examples }
JunUFFIOpenGLRenderingContext class >> example4 [
	"JunUFFIOpenGLRenderingContext example4"

	| benzene rc morph angle process form |
	benzene := Jun3dDisplayObject benzene.
	form := Form extent: 500 @ 500 depth: 32.
	rc := JunUFFIOpenGLRenderingContext on: form.
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
]

{ #category : #examples }
JunUFFIOpenGLRenderingContext class >> example5 [
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
]

{ #category : #examples }
JunUFFIOpenGLRenderingContext class >> example6 [
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
]

{ #category : #'instance creation' }
JunUFFIOpenGLRenderingContext class >> extent: aPoint [
	^ self on: (Form extent: aPoint depth: 32)
]

{ #category : #accessing }
JunUFFIOpenGLRenderingContext class >> gl [
	^ GL ifNil: [ GL := UFFIOpenGL new ]
]

{ #category : #'instance creation' }
JunUFFIOpenGLRenderingContext class >> on: aForm [
	self
		cacheLock: [ ^ self cache
				detect: [ :rc | rc form == aForm ]
				ifNone: [ self basicNew
						setForm: aForm;
						initialize;
						yourself ] ]
]

{ #category : #private }
JunUFFIOpenGLRenderingContext >> activate: aBlock [
	context isNil
		ifTrue: [ self setForm: self form ].
	context
		asCurrentDo: [ frameBuffer activate.
			aBlock value: context gl ]
]

{ #category : #lighting }
JunUFFIOpenGLRenderingContext >> ambientLight: aColor [
	ambientLight := aColor.
	self
		activate: [ :gl | 
			gl enable: GL_LIGHTING.
			gl enable: GL_COLOR_MATERIAL.
			gl lightModelfv_pname: GL_LIGHT_MODEL_AMBIENT params: aColor asByteArray4f.
			gl lightModeli_pname: GL_LIGHT_MODEL_LOCAL_VIEWER param: GL_FALSE.
			gl lightModeli_pname: GL_LIGHT_MODEL_TWO_SIDE param: GL_TRUE ]
]

{ #category : #accessing }
JunUFFIOpenGLRenderingContext >> backgroundColor: aColor [
	super backgroundColor: aColor.
	self
		activate: [ :gl | 
			gl
				clearColor_red: self backgroundColor red
				green: self backgroundColor green
				blue: self backgroundColor blue
				alpha: self backgroundColor alpha ]
]

{ #category : #private }
JunUFFIOpenGLRenderingContext >> checkStatus [
	| status |
	self
		activate: [ :gl | 
			status := gl checkFramebufferStatusEXT: GL_FRAMEBUFFER.
			status = GL_FRAMEBUFFER_COMPLETE
				ifFalse:
					[ #(#GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT #GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT #GL_FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER #GL_FRAMEBUFFER_INCOMPLETE_READ_BUFFER #GL_FRAMEBUFFER_UNSUPPORTED #GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE #GL_FRAMEBUFFER_UNDEFINED)
						do: [ :sym | 
							(self class bindingOf: sym)
								ifNotNil: [ :b | 
									status = b value
										ifTrue: [ ^ self error: 'Frame buffer is incomplete: ' , b key ] ] ].
					^ self error: 'Frame buffer status: Unknown error' ].
			^ true	"ok" ]
]

{ #category : #displaying }
JunUFFIOpenGLRenderingContext >> clear [
	self activate: [ :gl | gl clear: GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT ]
]

{ #category : #accessing }
JunUFFIOpenGLRenderingContext >> color: aColor [
	super color: aColor.
	aColor ifNil: [ ^ self ].
	self
		activate: [ :gl | 
			gl
				color4f_red: aColor red
				green: aColor green
				blue: aColor blue
				alpha: aColor alpha ]
]

{ #category : #accessing }
JunUFFIOpenGLRenderingContext >> cullFace: aBoolean [
	aBoolean == true
		ifTrue: [ self enableCullface ]
		ifFalse: [ self disableCullface ]
]

{ #category : #culling }
JunUFFIOpenGLRenderingContext >> disableCullface [
	self activate: [ :gl | gl disable: GL_CULL_FACE ]
]

{ #category : #'z buffering' }
JunUFFIOpenGLRenderingContext >> disableDepthTest [
	self activate: [ :gl | gl disable: GL_DEPTH_TEST ]
]

{ #category : #lighting }
JunUFFIOpenGLRenderingContext >> disableLightIndex: anInteger [
	self activate: [ :gl | gl disable: GL_LIGHT0 + anInteger ]
]

{ #category : #lighting }
JunUFFIOpenGLRenderingContext >> disableLighting [
	self activate: [ :gl | gl disable: GL_LIGHTING ]
]

{ #category : #rendering }
JunUFFIOpenGLRenderingContext >> displayLines: anArrayOfJun3dPoint1 [
	| n |
	anArrayOfJun3dPoint1 size >= 3
		ifTrue: [ n := Jun3dPoint normalUnitVectorOfPoints: anArrayOfJun3dPoint1 ].
	self
		activate: [ :gl | 
			gl begin: GL_LINES.
			n ifNotNil: [ gl normal3d_nx: n x ny: n y nz: n z ].
			anArrayOfJun3dPoint1 do: [ :p | gl vertex3d_x: p x y: p y z: p z ].
			gl end ]
]

{ #category : #rendering }
JunUFFIOpenGLRenderingContext >> displayLines: anArrayOfJun3dPoint1 normalVectors: anArrayOfJun3dPoint2 [
	self
		activate: [ :gl | 
			gl begin: GL_LINES.
			anArrayOfJun3dPoint1
				with: anArrayOfJun3dPoint2
				do: [ :p :n | 
					gl normal3d_nx: n x negated ny: n y negated nz: n z negated.
					gl vertex3d_x: p x y: p y z: p z ].
			gl end ]
]

{ #category : #rendering }
JunUFFIOpenGLRenderingContext >> displayPolygon: anArrayOfJun3dPoint1 [
	| n |
	presentation = #wireframe
		ifTrue: [ ^ self displayLines: anArrayOfJun3dPoint1 ].
	n := Jun3dPoint normalUnitVectorOfPoints: anArrayOfJun3dPoint1.
	self
		activate: [ :gl | 
			gl begin: GL_POLYGON.
			gl normal3d_nx: n x ny: n y nz: n z.
			anArrayOfJun3dPoint1 do: [ :p | gl vertex3d_x: p x y: p y z: p z ].
			gl end ]
]

{ #category : #rendering }
JunUFFIOpenGLRenderingContext >> displayPolygon: anArrayOfJun3dPoint1 normalVectors: anArrayOfJun3dPoint2 [
	presentation = #wireframe
		ifTrue: [ ^ self displayLines: anArrayOfJun3dPoint1 normalVectors: anArrayOfJun3dPoint2 ].
	self
		activate: [ :gl | 
			gl begin: GL_POLYGON.
			anArrayOfJun3dPoint1
				with: anArrayOfJun3dPoint2
				do: [ :p :n | 
					gl normal3d_nx: n x negated ny: n y negated nz: n z negated.
					gl vertex3d_x: p x y: p y z: p z ].
			gl end ]
]

{ #category : #rendering }
JunUFFIOpenGLRenderingContext >> displayPolygon: anArrayOfJun3dPoint1 normalVectors: anArrayOfJun3dPoint2 texturePoints: anArrayOfJun2dPoint [
	presentation = #wireframe
		ifTrue: [ ^ self displayLines: anArrayOfJun3dPoint1 normalVectors: anArrayOfJun3dPoint2 ].
	self
		activate: [ :gl | 
			gl begin: GL_POLYGON.
			1 to: ((anArrayOfJun3dPoint1 size min: anArrayOfJun3dPoint2 size) min: anArrayOfJun2dPoint size) do: [ :index | 
				| t n p |
				t := anArrayOfJun2dPoint at: index.
				n := anArrayOfJun3dPoint2 at: index.
				p := anArrayOfJun3dPoint1 at: index.
				gl
					texCoord2d_s: t x t: t y;
					normal3d_nx: n x negated ny: n y negated nz: n z negated;
					vertex3d_x: p x y: p y z: p z ].
			gl end ]
]

{ #category : #rendering }
JunUFFIOpenGLRenderingContext >> displayPolygon: anArrayOfJun3dPoint1 texturePoints: anArrayOfJun2dPoint [
	| n |
	presentation = #wireframe
		ifTrue: [ ^ self displayLines: anArrayOfJun3dPoint1 ].
	n := Jun3dPoint normalUnitVectorOfPoints: anArrayOfJun3dPoint1.
	self
		activate: [ :gl | 
			gl begin: GL_POLYGON.
			gl normal3d_nx: n x ny: n y nz: n z.
			anArrayOfJun3dPoint1
				with: anArrayOfJun2dPoint
				do: [ :p :t | 
					gl
						texCoord2d_s: t x t: t y;
						vertex3d_x: p x y: p y z: p z ].
			gl end ]
]

{ #category : #culling }
JunUFFIOpenGLRenderingContext >> enableCullface [
	self
		activate: [ :gl | 
			gl
				enable: GL_CULL_FACE;
				cullFace: GL_FRONT ]
]

{ #category : #'z buffering' }
JunUFFIOpenGLRenderingContext >> enableDepthTest [
	self activate: [ :gl | gl enable: GL_DEPTH_TEST ]
]

{ #category : #lighting }
JunUFFIOpenGLRenderingContext >> enableLightIndex: anInteger [
	self activate: [ :gl | gl enable: GL_LIGHT0 + anInteger ]
]

{ #category : #lighting }
JunUFFIOpenGLRenderingContext >> enableLighting [
	self activate: [ :gl | gl enable: GL_LIGHTING ]
]

{ #category : #finalization }
JunUFFIOpenGLRenderingContext >> finalize [
	self class cache remove: self ifAbsent: [  ].
	Transcript
		cr;
		show: 'finalized'.
	context := nil.
	frameBuffer := nil
]

{ #category : #finalization }
JunUFFIOpenGLRenderingContext >> finalize: handle [
	self finalize
]

{ #category : #displaying }
JunUFFIOpenGLRenderingContext >> flush [
	forms first
		ifNotNil: [ :form | 
			form unhibernate.
			self
				activate: [ :gl | 
					gl
						finish;
						pixelStorei_pname: GL_PACK_ALIGNMENT param: 0;
						pixelStorei_pname: GL_PACK_ROW_LENGTH param: form extent x;
						pixelStorei_pname: GL_PACK_IMAGE_HEIGHT param: form extent y;
						pixelStorei_pname: GL_PACK_SKIP_PIXELS param: 0;
						pixelStorei_pname: GL_PACK_SKIP_ROWS param: 0;
						pixelStorei_pname: GL_PACK_SKIP_IMAGES param: 0;
						readPixels_x: 0
							y: 0
							width: form width
							height: form height
							format: GL_BGRA_EXT
							type: GL_UNSIGNED_BYTE
							pixels: form bits;
						finish ] ]
]

{ #category : #accessing }
JunUFFIOpenGLRenderingContext >> form [
	^ forms first
]

{ #category : #'initialize-release' }
JunUFFIOpenGLRenderingContext >> initialize [
	super initialize.
	textures := IdentityDictionary new
]

{ #category : #lighting }
JunUFFIOpenGLRenderingContext >> lightIndex: index0to7 parallel: direction color: aColor [
	| position lightColor |
	position := direction negated asByteArray4f.
	lightColor := aColor asByteArray4f.
	self
		activate: [ :gl | 
			| index |
			index := GL_LIGHT0 + index0to7.
			gl enable: GL_LIGHTING.
			gl enable: index.
			gl lightfv_light: index pname: GL_POSITION params: position.
			gl lightfv_light: index pname: GL_DIFFUSE params: lightColor.
			gl lightfv_light: index pname: GL_SPECULAR params: lightColor ]
]

{ #category : #lighting }
JunUFFIOpenGLRenderingContext >> lightStates [
	^ lightStates copy
]

{ #category : #accessing }
JunUFFIOpenGLRenderingContext >> maxLightIndex [
	^ 7
]

{ #category : #projecting }
JunUFFIOpenGLRenderingContext >> parallelProjection: aJunParallelProjection [
	forms first
		ifNotNil: [ :form | 
			| aspect halfHeight halfWidth |
			self setProjection: aJunParallelProjection copy.
			aspect := form width asFloat / form height asFloat.
			halfHeight := projection height / 2.0.
			halfWidth := halfHeight * aspect.
			self
				activate: [ :gl | 
					gl matrixMode: GL_PROJECTION.
					gl loadIdentity.
					gl
						ortho_left: halfWidth negated
						right: halfWidth
						bottom: halfHeight
						top: halfHeight negated
						zNear: projection near
						zFar: projection far.
					gl matrixMode: GL_MODELVIEW.
					gl loadIdentity.
					gl
						loadMatrixf:
							(Jun3dTransformation
								fromOrigin: aJunParallelProjection eyePoint
								xAxis: aJunParallelProjection unitRightVector
								yAxis: aJunParallelProjection unitUpVector
								zAxis: aJunParallelProjection unitSightVector negated) asByteArray16f ] ]
]

{ #category : #projecting }
JunUFFIOpenGLRenderingContext >> perspectiveProjection: aJunPerspectiveProjection [
	forms first
		ifNotNil: [ :form | 
			| aspect halfHeight halfWidth |
			self setProjection: aJunPerspectiveProjection copy.
			aspect := form width asFloat / form height.
			halfHeight := (aJunPerspectiveProjection fovy / 2.0) tan
				* aJunPerspectiveProjection near.
			halfWidth := halfHeight * aspect.
			self
				activate: [ :gl | 
					gl matrixMode: GL_PROJECTION.
					gl loadIdentity.
					gl
						frustum_left: halfWidth negated asFloat
						right: halfWidth asFloat
						bottom: halfHeight asFloat
						top: halfHeight negated asFloat
						zNear: aJunPerspectiveProjection near asFloat
						zFar: aJunPerspectiveProjection far asFloat.
					gl matrixMode: GL_MODELVIEW.
					gl loadIdentity.
					gl
						loadMatrixf:
							(Jun3dTransformation
								fromOrigin: aJunPerspectiveProjection eyePoint
								xAxis: aJunPerspectiveProjection unitRightVector
								yAxis: aJunPerspectiveProjection unitUpVector
								zAxis: aJunPerspectiveProjection unitSightVector negated) asByteArray16f ] ]
]

{ #category : #private }
JunUFFIOpenGLRenderingContext >> setForm: aForm [
	| gl |
	forms := WeakArray with: aForm.
	context := UFFIOpenGLContext new.
	self class cache add: self.
	aForm toFinalizeSend: #finalize: to: self with: nil.
	gl := context gl.
	frameBuffer := JunUFFIOpenGLOffscreenTextureBuffer new
		extent: aForm extent;
		context: context;
		yourself.
	context
		asCurrentDo: [ frameBuffer activate.
			gl
				viewport_x: 0
					y: 0
					width: aForm width
					height: aForm height;
				depthMask: true;
				enable: GL_NORMALIZE;
				enable: GL_DEPTH_TEST;
				clearColor_red: self backgroundColor red
					green: self backgroundColor green
					blue: self backgroundColor blue
					alpha: self backgroundColor alpha;
				clear: GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT ]
]

{ #category : #'texture mapping' }
JunUFFIOpenGLRenderingContext >> withTexture: aJunTexture do: aBlock [
	self
		activate: [ :gl | 
			| textureName |
			textureName := textures
				at: aJunTexture
				ifAbsentPut: [ | name |
					gl pixelStorei_pname: GL_UNPACK_ALIGNMENT param: 1.
					name := ByteArray new: 64.
					gl genTextures_n: 1 textures: name.
					gl
						bindTexture_target: GL_TEXTURE_2D texture: (name unsignedLongAt: 1);
						texParameteri_target: GL_TEXTURE_2D pname: GL_TEXTURE_WRAP_S param: GL_REPEAT;
						texParameteri_target: GL_TEXTURE_2D pname: GL_TEXTURE_WRAP_T param: GL_REPEAT;
						texParameteri_target: GL_TEXTURE_2D pname: GL_TEXTURE_MIN_FILTER param: GL_NEAREST;
						texParameteri_target: GL_TEXTURE_2D pname: GL_TEXTURE_MAG_FILTER param: GL_NEAREST;
						texImage2D_target: GL_TEXTURE_2D
							level: 0
							internalformat: GL_RGBA
							width: aJunTexture width
							height: aJunTexture height
							border: 0
							format: GL_RGBA
							type: GL_UNSIGNED_BYTE
							pixels: aJunTexture bytes.
					name ].
			gl
				enable: GL_TEXTURE_2D;
				texEnvf_target: GL_TEXTURE_ENV pname: GL_TEXTURE_ENV_MODE param: GL_DECAL;
				bindTexture_target: GL_TEXTURE_2D texture: (textureName unsignedLongAt: 1) ].
	^ aBlock
		ensure: [ self
				activate: [ :gl | 
					gl
						end;
						disable: GL_TEXTURE_2D ] ]
]
