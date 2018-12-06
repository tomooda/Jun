private
startUpdateProcess
	updateProcess ifNotNil: [ updateProcess terminate ].
	updateProcess := [ 
	[ 
	| t0 |
	self world ifNil: [ updateProcess terminate ].
	t0 := Time millisecondClockValue.
	dirty = true
		ifTrue: [ self changed ].
	(Delay forMilliseconds: 100) wait.
	(Delay forMilliseconds: (Time millisecondClockValue - t0 min: 1000 max: 100)) wait ] repeat ]
		forkAt: Processor userBackgroundPriority