accessing
area
	| area |
	area := 0.
	self asTriangles do: [ :triangle | area := area + triangle area ].
	^ area