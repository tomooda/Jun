converting
asJunOpenGL3dObjectColor: aColor 
	"((0 , 0 , 0 box: 1 , 1 , 1) asJunOpenGL3dObjectColor: ColorValue red) show."

	| compoundObject |
	compoundObject := self asJunOpenGL3dObject.
	compoundObject objectsDo: [:each | each color: nil].
	compoundObject color: aColor.
	^compoundObject