instance creation
fromObject: anObject
	"Jun3dBoundingBox fromObject: (JunOpenGL3dObject benzene)."

	"(JunOpenGL3dCompoundObject
		with: ((Jun2dBoundingBox fromObject: (JunOpenGL3dObject benzene asPointArray collect: [:p | p x , p y]))
				asJunOpenGL3dObjectColor: ColorValue cyan alpha: 0.5)
		with: JunOpenGL3dObject benzene) show."

	"(JunOpenGL3dCompoundObject
		with: ((Jun3dBoundingBox fromObject: JunOpenGL3dObject benzene)
					asJunOpenGL3dObjectColor: ColorValue cyan alpha: 0.5)
		with: JunOpenGL3dObject benzene) show."

	| aCollection |
	aCollection := (anObject isKindOf: Collection)
		ifTrue: [ anObject asArray ]
		ifFalse: [ anObject asPointArray ].
	^ self fromPoints: aCollection