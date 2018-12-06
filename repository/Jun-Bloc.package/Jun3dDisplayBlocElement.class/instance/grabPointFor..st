viewing
grabPointFor: aPoint
	^ (aPoint - (self innerBounds extent * 0.5)) * (2.0 @ -2.0)
		/ self innerBounds height