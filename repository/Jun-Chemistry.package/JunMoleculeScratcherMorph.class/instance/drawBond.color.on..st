drawing
drawBond: aJunBond color: aColor on: aCanvas
	| p1 p2 v |
	p1 := self moleculePointToScreenPoint: aJunBond atom1 position.
	p2 := self moleculePointToScreenPoint: aJunBond atom2 position.
	v := Point r: 1.0 degrees: (p2 - p1) theta radiansToDegrees + 90.0.
	1 to: aJunBond order do: [ :i | 
		| offset |
		offset := (i - (aJunBond order / 2.0)) * 4 * v.
		aCanvas
			line: p1 + offset
			to: p2 + offset
			width: 1.0
			color: aColor ]