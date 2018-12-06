converting
alignedRectangleWithCenter: centerPoint
	"(400 , 300) alignedRectangleWithCenter: (400 , 300)."
	"(400 , 300 , 200) alignedRectangleWithCenter: (400 , 300 , 200)."

	^ JunGeometry alignedBox: self asPoint rounded withCenter: centerPoint asPoint rounded