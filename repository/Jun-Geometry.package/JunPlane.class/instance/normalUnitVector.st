functions
normalUnitVector
	"(JunPlane on: -2 , -2 , 0 on: 2 , 0 , 0 on: -2 , 2 , 0) normalUnitVector."

	"(JunPlane on: 2 , 0 , 0 on: 0 , 2 , 0 on: 0 , 0 , 2) normalUnitVector."

	| n nuv |
	n := self n.
	nuv := Jun3dPoint x: a * n y: b * n z: c * n.
	^ nuv