accessing
bytes
	^ bytes
		ifNil: [ 
			form
				ifNotNil: [ 
					| array |
					array := ByteArray
						new: form width * form height
						streamContents: [ :stream | 
							0 to: form height-1 do: [ :y | 
								0 to: form width-1 do: [ :x | 
									| c |
									c := form colorAt: x @ y.
									stream nextPut: ((c red * 256) truncated min: 255).
									stream nextPut: ((c green * 256) truncated min: 255).
									stream nextPut: ((c blue * 256) truncated min: 255).
									stream nextPut: ((c alpha * 256) truncated min: 255) ] ] ].
					bytesCacheEnabled
						ifTrue: [ bytes := array ].
					array ] ]