accessing
boundingBox
	^ atoms
		ifEmpty: [ Jun3dBoundingBox zero ]
		ifNotEmpty: [ 
			| box |
			box := atoms first boundingBox.
			2 to: atoms size do: [ :i | box := box merge: (atoms at: i) boundingBox ].
			box ]