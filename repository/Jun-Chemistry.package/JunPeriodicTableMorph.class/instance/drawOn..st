drawing
drawOn: aCanvas
	| width height |
	aCanvas
		frameAndFillRectangle: self bounds
		fillColor: (Color gray: 0.95)
		borderWidth: 1
		borderColor: Color black.
	width := self extent x / 18.0.
	height := self extent y / self maxPeriod asFloat.
	JunAtom
		allSubclassesDo: [ :atomClass | 
			| symbol |
			symbol := atomClass symbol.
			atomClass == selectedAtom
				ifTrue: [ 
					aCanvas
						fillRectangle:
							(((atomClass group - 1) * width + self bounds left) @ ((atomClass period - 1) * height + self bounds top)
								extent: width @ height)
						color: Color lightGray ].
			atomClass == hoverAtom
				ifTrue: [ 
					aCanvas
						frameRectangle:
							(((atomClass group - 1) * width + self bounds left) @ ((atomClass period - 1) * height + self bounds top)
								extent: width @ height)
						color: Color black ].
			aCanvas
				drawString: symbol
				at:
					((atomClass group - 1) * width + self bounds left + ((width - (font widthOfString: symbol)) / 2.0))
						@ ((atomClass period - 1) * height + self bounds top + ((height - font height) / 2.0))
				font: font
				color: Color black ]