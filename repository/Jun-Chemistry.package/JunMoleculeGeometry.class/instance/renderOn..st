rendering
renderOn: aJunRenderingContext
	self size > 64
		ifTrue: [ self do: [ :atom | atom renderRoughOn: aJunRenderingContext ] ]
		ifFalse: [ self do: [ :atom | atom renderOn: aJunRenderingContext ] ].
	self bondsDo: [ :bond | bond renderOn: aJunRenderingContext ]