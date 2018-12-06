transforming
transform: aJunTransformation
	| motion |
	motion := self new.
	self do: [ :molecule | motion add: (molecule transform: aJunTransformation) ].
	^ motion