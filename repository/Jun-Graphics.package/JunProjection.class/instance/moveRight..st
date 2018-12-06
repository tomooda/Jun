moving
moveRight: aNumber
	"Move the eyePoint to aNumber backward from the center"

	self eyePoint: self eyePoint + (self unitRightVector * aNumber)