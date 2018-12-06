accessing
peerOf: aJunAtom
	atom1 == aJunAtom
		ifTrue: [ ^ atom2 ].
	atom2 == aJunAtom
		ifTrue: [ ^ atom1 ].
	^ nil