converting
asPointArrays
	^ self asArrays collect: [ :array | array collect: [ :each | each asPoint ] ]