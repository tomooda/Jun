instance creation
fromXYZ: aStringOrStream
	"(JunMoleculeGeometry fromXYZ: (UIManager default fileOpen: 'Please select an XYZ file' extensions: #('xyz'))) inspect"

	| molecule |
	molecule := self new.
	aStringOrStream readStream
		in: [ :source | 
			| size |
			size := source nextLine trim asNumber.
			molecule label: source nextLine.
			size timesRepeat: [ molecule add: (JunAtom fromXYZLine: source nextLine) ] ].
	^ molecule