utilities
numberOfPrimitives
	| count |
	count := 0.
	self primitivesDo: [ :object | count := count + 1 ].
	^ count