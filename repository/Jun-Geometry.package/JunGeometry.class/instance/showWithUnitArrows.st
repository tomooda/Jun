viewing
showWithUnitArrows
	"(0 , 0 box: 1 , 1) showWithUnitArrows."

	"(0 , 0 , 0 box: 1 , 1 , 1) showWithUnitArrows."

	^ self notYetImplemented "| arrowObject |
	self is2d
		ifTrue: [ arrowObject := JunOpenGL3dObject xyUnitArrows ]
		ifFalse: [ arrowObject := JunOpenGL3dObject xyzUnitArrows ].
	^ (self asJunOpenGL3dObject asCompoundObject
		add: arrowObject;
		yourself) show"