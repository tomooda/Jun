utilities
translateTo3dPointFromPoint: aPoint depth: aNumber
	| scale forward right up |
	scale := aNumber * (self fovy div: 2) tan abs.
	forward := self unitSightVector * aNumber.
	right := self unitRightVector * (aPoint x * scale).
	up := self unitUpVector * (aPoint y * scale).
	^ self eyePoint + forward + right + up