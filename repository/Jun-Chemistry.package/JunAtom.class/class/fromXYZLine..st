instance creation
fromXYZLine: aString
	^ aString trim substrings
		in: [ :atomXYZ | 
			(self symbol: atomXYZ first)
				at:
					(Jun3dPoint x: atomXYZ second asNumber asFloat y: atomXYZ third asNumber asFloat z: atomXYZ fourth asNumber asFloat) ]