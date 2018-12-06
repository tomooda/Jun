constants
xy
	"(JunPlane xy) asJunOpenGL3dObject show."
	"(JunOpenGL3dCompoundObject 
		with: JunPlane xy asJunOpenGL3dObject
		with: JunPlane yz asJunOpenGL3dObject
		with: JunPlane zx asJunOpenGL3dObject
		with: JunOpenGL3dObject xyzArrows) show."

	^ self on: 0 _, 0 _, 0 on: 1 _, 0 _, 0 on: 0 _, 1 _, 0