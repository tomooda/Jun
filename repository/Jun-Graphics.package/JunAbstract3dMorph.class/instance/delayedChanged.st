private
delayedChanged
	dirty := true.
	(updateProcess isNil or: [ updateProcess isTerminated ])
		ifTrue: [ self startUpdateProcess ]