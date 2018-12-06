converting
reversed
	| reversed |
	reversed := self copy.
	reversed setComponents: (components collect: [ :object | object reversed ]).
	^ reversed