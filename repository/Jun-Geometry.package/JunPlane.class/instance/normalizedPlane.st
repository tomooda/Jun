functions
normalizedPlane
	"(JunPlane on: -2 , -2 , 0 on: 2 , 0 , 0 on: -2 , 2 , 0) normalizedPlane."

	"(JunPlane on: -2 , -2 , 0 on: 2 , 0 , 0 on: -2 , 2 , 0) normalizedPlane normalVector."

	"(JunPlane on: -2 , -2 , 0 on: 2 , 0 , 0 on: -2 , 2 , 0) normalUnitVector."

	"(JunPlane on: 2 , 0 , 0 on: 0 , 2 , 0 on: 0 , 0 , 2) normalizedPlane."

	"(JunPlane on: 2 , 0 , 0 on: 0 , 2 , 0 on: 0 , 0 , 2) normalizedPlane normalVector."

	"(JunPlane on: 2 , 0 , 0 on: 0 , 2 , 0 on: 0 , 0 , 2) normalUnitVector."

	| copy n |
	copy := self copy.
	n := self n.
	copy setA: a * n.
	copy setB: b * n.
	copy setC: c * n.
	copy setD: d.
	^ copy