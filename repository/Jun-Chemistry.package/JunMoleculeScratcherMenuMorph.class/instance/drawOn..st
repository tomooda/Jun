drawing
drawOn: aCanvas
	aCanvas fillRectangle: self bounds color: (Color gray alpha: 0.5).
	1 to: actions size do: [ :index | 
		| triple stringExtent |
		triple := actions at: index.
		stringExtent := (font widthOfString: triple second) @ font height.
		aCanvas
			fillRectangle: (Rectangle center: triple first extent: stringExtent * 2)
			color:
				(index = selectionIndex
					ifTrue: [ Color white ]
					ifFalse: [ Color gray ]).
		aCanvas
			drawString: triple second
			at: triple first - (stringExtent / 2.0)
			font: font
			color: Color black ]