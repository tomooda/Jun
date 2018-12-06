instance creation
fromXYZ: aStringOrStream
	"(JunMoleculeMotionGeometry fromXYZ: (UIManager default fileOpen: 'Please select an XYZ file' extensions: #('xyz'))) autoBonds; show"

	| motionMolecule |
	motionMolecule := self new.
	aStringOrStream readStream
		in: [ :source | 
			[ source atEnd ]
				whileFalse: [ 
					[ motionMolecule add: (self moleculeClass fromXYZ: source) ]
						on: Error
						do: [ :ex | 
							source atEnd
								ifFalse: [ ex pass ] ] ] ].
	^ motionMolecule