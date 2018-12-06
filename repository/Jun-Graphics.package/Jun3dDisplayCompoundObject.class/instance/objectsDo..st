enumerating
objectsDo: aBlock
	super objectsDo: aBlock.
	components do: [ :obj | obj objectsDo: aBlock ]