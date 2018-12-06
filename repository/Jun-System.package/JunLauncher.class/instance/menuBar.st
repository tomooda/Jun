interface building
menuBar
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