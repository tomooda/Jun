drawing
drawOn: aCanvas
	aCanvas fillRectangle: self bounds color: Color white.
	bondBuffer do: [ :bond | self drawBond: bond color: Color gray on: aCanvas ].
	moleculeGeometry bondsDo: [ :bond | self drawBond: bond color: Color black on: aCanvas ].
	atomBuffer do: [ :atom | self drawAtom: atom color: Color gray on: aCanvas ].
	moleculeGeometry atomsDo: [ :atom | self drawAtom: atom color: Color black on: aCanvas ].
