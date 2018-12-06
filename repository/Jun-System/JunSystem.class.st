"
A JunSystem is a utility object to manage installation and startup/shutdown of Smalltalk images so that some external resources can be managed. Many functionalities of the original JunSystem on VisualWorks is now provided by the Pharo system.
"
Class {
	#name : #JunSystem,
	#superclass : #Model,
	#classVars : [
		'ArchitectureName',
		'MemorisedFonts',
		'PlatformName',
		'RuntimeVersion'
	],
	#classInstVars : [
		'soleSystem'
	],
	#category : 'Jun-System-System'
}

{ #category : #about }
JunSystem class >> about [
	"JunSystem about"

	^ self aboutForSeconds: 60
]

{ #category : #about }
JunSystem class >> aboutForSeconds: anInteger [
	^ [ 
	self logo
		in: [ :logo | 
			| form logoMorph |
			form := Form extent: logo extent + (24 @ 8).
			form getCanvas
				fillColor: Color white;
				paintImage: logo at: (form extent - logo extent) // 2;
				frameRectangle: (0 @ 0 extent: form extent) color: Color gray.
			logoMorph := form asMorph.
			logoMorph on: #click send: #delete to: logoMorph.
			logoMorph
				center: World bounds center;
				openInWorld.
			Processor yield.
			anInteger seconds wait.
			logoMorph delete ] ] forkAt: Processor userBackgroundPriority
]

{ #category : #copyright }
JunSystem class >> date [
	^ '2014/12/12' copy
]

{ #category : #defaults }
JunSystem class >> defaultBaseName [
	"JunSystem defaultBaseName."

	^self defaultDateAndTimeString
]

{ #category : #logout }
JunSystem class >> epilogue [
	self epilogueAction.
	self soleSystem changed: #epilogue
]

{ #category : #logout }
JunSystem class >> epilogueAction [
	"JunSystem epilogueAction."
]

{ #category : #'class initialization' }
JunSystem class >> initialize [
	"JunSystem initialize."

	soleSystem := nil.
	ArchitectureName := nil.
	PlatformName := nil.
	RuntimeVersion = false.
	MemorisedFonts := nil.
	self install.
	self prologue
]

{ #category : #'class initialization' }
JunSystem class >> install [
	"JunSystem install."

	Smalltalk
		addToStartUpList: self;
		addToShutDownList: self
]

{ #category : #login }
JunSystem class >> login [
	self loginAction.
	self soleSystem changed: #login
]

{ #category : #login }
JunSystem class >> loginAction [
	"JunSystem loginAction."

	
]

{ #category : #logo }
JunSystem class >> logo [
	"JunSystem logo asMorph openInWindow"

	| form logo  |
	form := self logoImage.
	logo := Form extent: form extent + (0 @ 24) depth: 32.
	logo getCanvas
		in: [ :canvas | 
			canvas fillColor: Color white.
			canvas paintImage: form at: (logo extent - form extent) // 2.
			((self system , self version) asText allBold , ' (' , self date , ')') asMorph
				in: [ :textMorph | 
					textMorph position: 0 @ 0; extent: form extent.
					textMorph fullDrawOn: canvas ].
			canvas flush ].
	^ logo
]

{ #category : #logo }
JunSystem class >> logoImage [
	^ Form
		extent: 256 @ 165
		depth: 1
		fromArray:
			#(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1536 0 0 0 0 0 0 0 960 0 0 0 0 0 0 0 1008 0 0 0 0 0 0 0 504 0 0 0 0 0 0 0 510 0 0 0 0 0 0 0 511 0 0 0 0 0 0 0 255 2147483648 0 0 0 0 0 0 255 2147483648 0 0 0 0 0 0 255 3221225472 0 0 0 0 0 0 127 3758096384 0 0 0 0 0 0 127 3758096384 50331648 0 0 0 0 0 127 3758096384 62914560 0 0 0 0 0 127 4026531840 65011712 0 0 0 0 0 127 4026531840 66060288 0 0 0 0 0 127 4026531840 33292288 0 0 0 0 0 127 4026531840 33423360 0 0 0 0 0 127 4026531840 33488896 0 0 0 0 0 127 4160749568 33521664 0 0 0 0 0 127 4160749568 16744448 0 0 0 0 0 127 4160751111 16760832 0 0 0 0 0 127 4160751503 16760832 0 0 0 0 0 127 4160753663 2155864064 0 0 0 0 0 127 4026535935 2155855872 0 0 0 0 0 127 4026535935 2155855872 0 0 0 0 0 127 4026533887 3225403392 0 0 0 0 0 127 4026533887 3225403392 0 0 0 0 0 255 4026533887 3223289856 0 0 0 0 0 255 4026533887 3221225472 0 0 0 0 0 255 4026532863 3221225472 0 0 0 0 0 255 3758097407 2147483648 0 0 0 0 0 255 3758096895 2147483648 0 0 0 0 0 255 3758096639 0 0 0 0 0 0 255 3758096510 0 0 0 0 0 0 255 3758096440 0 0 0 0 0 0 255 3221225472 0 0 0 0 0 0 511 3221225472 0 0 0 0 0 0 511 3221225472 0 0 0 0 0 0 511 3221225472 0 0 0 0 0 0 511 3221225472 0 0 0 0 0 0 511 2147483648 0 0 0 0 0 0 511 2147483648 0 0 0 0 0 0 511 2147483648 0 0 0 0 0 0 511 2147483648 0 0 0 0 0 0 1023 2147483648 0 0 0 0 0 0 1023 0 0 0 0 0 0 0 1023 0 0 0 0 0 0 0 1023 0 0 0 0 0 0 0 1023 0 0 0 0 0 0 0 1023 0 0 0 0 0 0 0 1022 0 0 0 0 0 0 0 1022 0 0 0 0 0 0 0 1022 0 0 0 0 0 0 0 1022 0 0 0 0 0 0 0 2046 0 0 0 0 0 0 0 2046 0 0 0 0 0 0 0 2046 0 0 0 0 0 0 0 2046 0 0 0 0 0 0 0 2046 0 0 0 0 0 0 0 2046 0 0 0 0 0 0 0 2046 0 0 0 0 0 0 0 2046 0 0 0 0 0 0 0 2046 0 0 0 0 0 0 0 2046 0 0 0 0 0 0 0 1022 0 0 0 0 0 0 0 1022 0 0 0 0 0 0 0 1022 0 0 0 0 0 0 0 1022 0 0 0 0 0 0 0 1022 0 0 0 253952 0 0 0 1022 0 0 0 258048 0 0 0 1022 0 0 0 258048 0 0 0 1023 0 0 0 61440 0 0 0 1023 0 0 0 63488 0 0 0 511 0 0 0 63488 0 0 0 511 0 0 0 65024 0 0 0 511 2147483648 0 0 3221749632 0 0 0 511 2147483648 0 1 3225419712 0 0 0 511 2147483648 0 1 3229613024 0 0 0 255 3221225472 0 1 3254548960 0 0 0 255 3221225472 0 1 3287316960 0 49152 0 255 3758096384 0 1 3351280112 0 57344 0 127 3758096384 0 3 3347118320 0 57344 0 127 4026531840 0 3 3472945648 0 126976 0 127 4026531840 0 3 3456168432 0 126976 0 63 4160749568 0 3 3456168432 0 126976 0 63 4160749568 0 3 3456168432 0 126976 0 31 4227858432 0 1 3993039856 0 253952 0 31 4261412864 0 1 3993040864 0 253952 0 15 4261412864 0 1 4262395872 0 245760 0 15 4278190080 0 1 4262461376 0 245760 0 7 4286578688 0 1 4262461312 0 491520 0 7 4290772992 0 0 4261936640 0 491520 0 3 4290772992 0 0 4261936128 0 491520 0 1 4292870144 0 0 2114043904 0 983040 0 0 4293918720 0 0 1040302080 0 983040 0 0 2146959360 0 0 469876736 0 917504 0 0 1073610752 0 0 229376 0 1966080 0 0 536805376 0 0 229376 0 1966080 0 0 268402688 0 0 196608 0 1835008 0 0 134201344 0 0 393216 0 3932160 0 0 33550336 0 0 786432 0 3670016 0 0 8387584 0 0 0 0 3670016 0 0 2096640 0 0 0 0 7962624 0 0 262016 0 0 0 0 7847936 0 0 16352 0 0 0 0 16236544 196608 0 248 0 0 0 0 16760832 393216 0 0 0 0 0 0 16760832 393216 0 0 0 0 0 0 33538048 917504 0 0 0 0 0 0 33546240 786432 0 0 0 0 0 0 67100672 1835008 0 0 0 0 0 0 67100672 3932160 0 0 0 0 0 0 67100672 7864320 0 0 0 0 0 0 133947392 7864320 0 0 0 0 0 0 133427200 15728640 0 0 0 0 0 0 267513856 31457280 0 0 0 0 0 0 266465280 65011712 0 0 0 0 0 0 534902784 130023424 0 0 0 0 0 0 532740096 130023424 0 0 0 0 0 0 1069612032 260046848 0 0 0 0 0 0 2139159552 520093696 0 0 0 0 0 0 2139127296 1040187392 0 0 0 0 0 0 4278222592 4261412864 0 0 0 0 0 1 4278206337 4227858432 0 0 0 0 0 1 4261429231 4160749568 0 0 0 0 0 3 4261421055 4026531840 0 0 0 0 0 3 4227862527 3758096384 0 0 0 0 0 3 4227862527 3221225472 0 0 0 0 0 3 4227860479 0 0 0 0 0 0 1 4160750076 0 0 0 0 0 0 0 4160749568 0 0 0 0 0 0 0 1879048192 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
		offset: 0 @ 0
]

{ #category : #logout }
JunSystem class >> logout [
	self logoutAction.
	self soleSystem changed: #logout
]

{ #category : #logout }
JunSystem class >> logoutAction [
	"JunSystem epilogueAction."
]

{ #category : #'instance creation' }
JunSystem class >> new [
	^ self soleSystem
]

{ #category : #login }
JunSystem class >> prologue [
	self prologueAction.
	self soleSystem changed: #prologue
]

{ #category : #login }
JunSystem class >> prologueAction [
	"JunSystem prologueAction."

	
]

{ #category : #logout }
JunSystem class >> shutDown: quitting [
	quitting = true
		ifTrue: [ self logout ]
		ifFalse: [ self epilogue ]
]

{ #category : #'instance creation' }
JunSystem class >> soleSystem [
	soleSystem isNil
		ifTrue: [ soleSystem := super new ].
	^ soleSystem
]

{ #category : #login }
JunSystem class >> startUp: resuming [
	resuming = true
		ifTrue: [ self login ]
		ifFalse: [ self prologue ]
]

{ #category : #copyright }
JunSystem class >> system [
	^ 'Jun' copy
]

{ #category : #copyright }
JunSystem class >> version [
	^ '001' copy
]
