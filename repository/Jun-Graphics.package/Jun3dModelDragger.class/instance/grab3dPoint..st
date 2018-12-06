computing
grab3dPoint: aPoint
	| depth |
	depth := (1.0 - aPoint x squared - aPoint y squared max: 0.0) sqrt negated.
	^ projection sightPoint + (projection unitUpVector * aPoint y) + (projection unitRightVector * aPoint x)
		+ (projection unitSightVector * depth)