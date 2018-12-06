accessing
vanDerWaalsBoundingBox
	^ moleculeGeometries
		ifEmpty: [ Jun3dBoundingBox zero ]
		ifNotEmpty: [ 
			| box |
			box := moleculeGeometries first boundingBox.
			2 to: moleculeGeometries size do: [ :i | box merge: (moleculeGeometries at: i) boundingBox ].
			box ]