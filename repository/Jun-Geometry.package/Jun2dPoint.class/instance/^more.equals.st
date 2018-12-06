comparing
>= aPoint
	self class = aPoint class
		ifTrue: [ ^ x >= aPoint x and: [ y >= aPoint y ] ].
	^ self retry: #>= coercing: aPoint