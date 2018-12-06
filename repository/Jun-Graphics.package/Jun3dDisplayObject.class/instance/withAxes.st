viewing
withAxes
	"JunOpenGL3dObject aoki withAxes show."

	^ self notYetImplemented "| box axes |
	box := self boundingBox merge: Jun3dPoint zero asBoundingBox.
	axes := self class xyzArrows 
				scaledBy: ((box width max: box height) max: box depth) * 1.2.
	^JunOpenGL3dCompoundObject with: self with: axes"