converting
asJunOpenGL3dObjectWithPoints
	"((1 , -1 , 0.5) to: (-1 , 1 , 0.5)) asJunOpenGL3dObjectWithPoints showWithAxes."

	^ self notYetImplemented "| aPolyline compoundObject |
	aPolyline := JunOpenGL3dPolyline 
				vertexes: (Array with: (self atT: -0.2) with: (self atT: 1.2)).
	aPolyline lineWidth: 1.
	aPolyline paint: ColorValue green.
	compoundObject := JunOpenGL3dCompoundObject new.
	compoundObject add: aPolyline.
	compoundObject add: (self from asJunOpenGL3dObject paint: ColorValue red).
	compoundObject add: (self to asJunOpenGL3dObject paint: ColorValue blue).
	^compoundObject"