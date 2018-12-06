drawing
drawOn: aCanvas at: aPoint scale: pixelsPerÅngströms radius: radius borderWidth: borderWidth borderColor: borderColor
	aCanvas
		fillOval:
			(self position x @ self position y negated * pixelsPerÅngströms + aPoint - radius extent: radius @ radius * 2.0)
		color: self color
		borderWidth: borderWidth
		borderColor: borderColor