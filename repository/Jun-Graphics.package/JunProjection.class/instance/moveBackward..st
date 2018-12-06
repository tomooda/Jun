moving
moveBackward: aNumber
	"Move the eyePoint to aNumber backward from the center"

	self eyePoint: self eyePoint - (self unitSightVector * aNumber)