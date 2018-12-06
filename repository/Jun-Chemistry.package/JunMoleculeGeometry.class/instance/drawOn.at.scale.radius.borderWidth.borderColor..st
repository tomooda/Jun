drawing
drawOn: aCanvas at: aPoint scale: pixelsPerÅngströms radius: radius borderWidth: borderWidth borderColor: borderColor
	(atoms asSortedCollection: [ :deeper :shallower | deeper position z <= shallower position z ])
		do: [ :atom | 
			atom
				drawOn: aCanvas
				at: aPoint
				scale: pixelsPerÅngströms
				radius: radius
				borderWidth: borderWidth
				borderColor: borderColor ]