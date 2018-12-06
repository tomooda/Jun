functions
whichSide: aPoint
	"(JunPlane on: (-2 , -2 , 0) on: (0 , 2 , 0) on: (2 , 0 , 0)) whichSide: (0 , 0 , 2)."

	^ (self valueF: aPoint) sign