utilities
alignedBox: extentPoint withCenter: centerPoint
	"JunGeometry alignedBox: 400 @ 300 withCenter: 100 @ 200."
	"JunGeometry alignedBox: 400 , 300 withCenter: 100 @ 200."
	"JunGeometry alignedBox: 400 , 300 , 200 withCenter: 100 @ 200."

	| aBox |
	aBox := extentPoint class zero extent: extentPoint.
	^ aBox align: aBox center with: centerPoint