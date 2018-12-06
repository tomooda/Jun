utilities
chooseAnAtomClass
	"JunPeriodicTableMorph chooseAnAtomClass browse"
	| morph |
	morph := self new.
	morph bounds left < 0 ifTrue: [ morph left: 0 ].
	morph bounds right > World bounds right ifTrue: [ morph right: World bounds right].
	morph bounds top < 0 ifTrue: [ morph top: 0 ].
	morph bounds bottom > World bounds bottom ifTrue: [ morph bottom: World bounds bottom ].
	morph action: [ :selection | morph delete ].
	World openModal: morph.
	^ morph selectedAtom