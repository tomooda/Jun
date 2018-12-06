viewing
grabPointFor: aPoint
	^ (aPoint - self innerBounds center) * (2.0 @ -2.0)
		/ self innerBounds height