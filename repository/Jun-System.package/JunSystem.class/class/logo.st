logo
logo
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