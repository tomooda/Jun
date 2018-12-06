instance creation
reopen
	"JunLauncher reopen"

	World allMorphs
		do: [ :m | 
			m class = self
				ifTrue: [ 
					| owner |
					owner := m owner.
					[ owner isNil or: [ owner isKindOf: SystemWindow ] ] whileFalse: [ owner := owner owner ].
					owner ifNotNil: [ owner delete ] ] ].
	self open