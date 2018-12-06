viewing
showWithArrows
	"(0 , 0 box: 1 , 1) showWithArrows."

	"(0 , 0 , 0 box: 1 , 1 , 1) showWithArrows."

	^ self notYetImplemented  "| arrowObject |
	self is2d
		ifTrue: [ arrowObject := JunOpenGL3dObject xyArrows ]
		ifFalse: [ arrowObject := JunOpenGL3dObject xyzArrows ].
	^ (self asJunOpenGL3dObject asCompoundObject
		add: arrowObject;
		yourself) show"