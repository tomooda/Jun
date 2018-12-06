moving
moveForward: aNumber
	"Move the eyePoint to aNumber forward to the center"

	self eyePoint: self eyePoint + (self unitSightVector * aNumber)