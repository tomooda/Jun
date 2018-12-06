about
aboutForSeconds: anInteger
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