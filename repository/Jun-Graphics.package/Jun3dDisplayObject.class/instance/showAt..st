viewing
showAt: displayPoint
	"JunOpenGL3dObject aoki showAt: 200@200."

	^ self
		showEyePoint: nil
		sightPoint: nil
		upVector: nil
		viewFactor: nil
		in: (displayPoint extent: 300 @ 300)