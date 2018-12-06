instance creation
on: aPoint normalVector: aVector
	"(JunPlane on: (1 , 1 , 1) normalVector: (1 , 1 , 1)) asJunOpenGL3dObject showWithAxes."
	"(JunPlane on: (1 , 1 , 0) normalVector: (-1 , -1 , 0))  asJunOpenGL3dObject showWithAxes."

	^ self on: aPoint vertical: (aPoint to: aPoint + aVector)