drawing
drawAtom: aJunAtom color: aColor on: aCanvas
	| symbol font extent diameter center |
	symbol := aJunAtom symbol.
	font := TextStyle default defaultFont.
	extent := (font widthOfString: symbol) @ font height.
	diameter := ((extent x squared + extent y squared) sqrt + 2.0).
	center := self moleculePointToScreenPoint: aJunAtom position.
	aCanvas fillOval: (Rectangle center: center extent: diameter @ diameter) color: (aJunAtom color mixed: 0.5 with: Color white).
	aCanvas
		drawString: symbol
		at: center - (extent / 2.0)
		font: font
		color: aColor