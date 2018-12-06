utilities
translateTo3dPointFromPoint: aPoint depth: aNumber
	| scale forward right up |
	scale := self height abs / 2.
	forward := self unitSightVector * aNumber.
	right := self unitRightVector * aPoint x * scale.
	up := self unitUpVector * aPoint y * scale.
	^ self eyePoint + forward + right + up