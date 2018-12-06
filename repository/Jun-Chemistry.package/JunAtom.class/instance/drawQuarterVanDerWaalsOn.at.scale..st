drawing
drawQuarterVanDerWaalsOn: aCanvas at: aPoint scale: pixelsPerÅngströms
	| radius |
	radius := self vanDerWaalsRadius / 4.0 * pixelsPerÅngströms.
	aCanvas
		fillOval:
			(self position x @ self position y negated * pixelsPerÅngströms + aPoint - radius extent: radius @ radius * 2.0)
		color: self color
		borderWidth: 1
		borderColor: Color black