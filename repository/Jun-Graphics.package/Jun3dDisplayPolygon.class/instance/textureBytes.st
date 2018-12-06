accessing
textureBytes
	^ textureBytes
		ifNil: [ 
			texture
				ifNotNil: [ 
					| bytes |
					bytes := ByteArray
						new: texture width * texture height
						streamContents: [ :stream | 
							1 to: texture height do: [ :y | 
								1 to: texture width do: [ :x | 
									| c |
									c := texture at: x @ y.
									stream nextPut: ((c red * 256) truncated min: 255).
									stream nextPut: ((c green * 256) truncated min: 255).
									stream nextPut: ((c blue * 256) truncated min: 255).
									stream nextPut: ((c alpha * 256) truncated min: 255) ] ] ].
					autoTextureCacheEnabled
						ifTrue: [ textureBytes := bytes ].
					bytes ] ]