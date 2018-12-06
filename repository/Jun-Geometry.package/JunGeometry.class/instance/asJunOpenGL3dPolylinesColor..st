converting
asJunOpenGL3dPolylinesColor: aColor 
	"((0 , 0 , 0 box: 1 , 2 , 3) asJunOpenGL3dPolylinesColor: ColorValue red) show."

	| compoundObject |
	compoundObject := self asJunOpenGL3dPolylines.
	compoundObject objectsDo: [:each | each color: nil].
	compoundObject color: aColor.
	^compoundObject