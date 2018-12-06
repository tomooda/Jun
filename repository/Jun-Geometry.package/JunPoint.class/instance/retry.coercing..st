coercing
retry: aSymbol coercing: aNumber
	aSymbol = #=
		ifTrue: [ 
			[ 
			self generality = aNumber generality
				ifTrue: [ ^ false ] ]
				on: MessageNotUnderstood
				do: [ :ex | ^ false ] ].
	((aNumber respondsTo: #generality) not or: [ self generality > aNumber generality ])
		ifTrue: [ ^ self perform: aSymbol with: (self coerce: aNumber) ].
	self generality < aNumber generality
		ifTrue: [ ^ (aNumber coerce: self) perform: aSymbol with: aNumber ].
	^ self error: 'coercion attempt failed'