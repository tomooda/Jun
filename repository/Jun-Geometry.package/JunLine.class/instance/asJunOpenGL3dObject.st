converting
asJunOpenGL3dObject
	"((1 , -1 , 0.5) to: (-1 , 1 , 0.5)) asJunOpenGL3dObject showWithAxes."

	^ self notYetImplemented "| aPolyline |
	aPolyline := JunOpenGL3dPolyline 
				vertexes: (Array with: self from with: self to).
	aPolyline lineWidth: 1.
	aPolyline paint: self defaultColor.
	^aPolyline"