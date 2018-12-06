private
gridify: aJun3dPoint from: aJunAtomOrNil
	^ aJunAtomOrNil
		ifNil: [ aJun3dPoint ]
		ifNotNil: [ 
			aJunAtomOrNil position
				+
					(Point
						r: aJunAtomOrNil covalentRadius + self defaultAtomClass covalentRadius
						degrees: ((aJun3dPoint - aJunAtomOrNil position) as2dPoint theta degrees roundTo: 30)) asJun3dPoint ]