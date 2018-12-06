private
activate: aBlock
	context isNil
		ifTrue: [ self setForm: self form ].
	context
		asCurrentDo: [ frameBuffer activate.
			aBlock value: context gl ]