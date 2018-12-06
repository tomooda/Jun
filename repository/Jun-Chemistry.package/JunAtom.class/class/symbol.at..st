instance creation
symbol: aString at: aJun3dPoint
	^ (self symbol: aString) ifNotNil: [ :element | element at: aJun3dPoint ]