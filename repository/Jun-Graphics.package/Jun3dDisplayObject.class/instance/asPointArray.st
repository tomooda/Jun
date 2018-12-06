converting
asPointArray
	| aStream |
	aStream := WriteStream on: (Array new: 128).
	self pointsDo: [ :point | aStream nextPut: point ].
	^ aStream contents