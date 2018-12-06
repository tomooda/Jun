boundary
boundaryConditionForRectangle: aRectangle
	| leftBlock rightBlock topBlock bottomBlock topLeft topRight bottomLeft bottomRight anotherTopLeft anotherBottomRight |
	topLeft := self translateTo3dPointInFarBoundaryPlaneFromPoint: aRectangle topLeft.
	topRight := self translateTo3dPointInFarBoundaryPlaneFromPoint: aRectangle topRight.
	bottomLeft := self translateTo3dPointInFarBoundaryPlaneFromPoint: aRectangle bottomLeft.
	bottomRight := self translateTo3dPointInFarBoundaryPlaneFromPoint: aRectangle bottomRight.
	anotherTopLeft := self translateTo3dPointInNearBoundaryPlaneFromPoint: aRectangle topLeft.
	anotherBottomRight := self translateTo3dPointInNearBoundaryPlaneFromPoint: aRectangle bottomRight.
	leftBlock := self
		boundaryConditionFrom3dPoint: topLeft
		and: bottomLeft
		and: anotherTopLeft
		includes: topRight.
	rightBlock := self
		boundaryConditionFrom3dPoint: topRight
		and: bottomRight
		and: anotherBottomRight
		includes: topLeft.
	topBlock := self
		boundaryConditionFrom3dPoint: topLeft
		and: topRight
		and: anotherTopLeft
		includes: bottomLeft.
	bottomBlock := self
		boundaryConditionFrom3dPoint: bottomLeft
		and: bottomRight
		and: anotherBottomRight
		includes: topLeft.
	^ [ :p | (leftBlock value: p) and: [ (rightBlock value: p) and: [ (topBlock value: p) and: [ bottomBlock value: p ] ] ] ]