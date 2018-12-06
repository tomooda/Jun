interface building
logo
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