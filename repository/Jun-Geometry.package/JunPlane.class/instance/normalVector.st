functions
normalVector
	"(JunPlane on: -2 , -2 , 0 on: 2 , 0 , 0 on: -2 , 2 , 0) normalVector."

	"(JunPlane on: 2 , 0 , 0 on: 0 , 2 , 0 on: 0 , 0 , 2) normalVector."

	| nv |
	nv := Jun3dPoint x: a y: b z: c.
	^ nv