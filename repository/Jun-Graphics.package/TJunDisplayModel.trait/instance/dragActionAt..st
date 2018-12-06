viewing
dragActionAt: aPoint
	self dragger
		ifNil: [ self dragger: (self createDraggerFor: (self grabPointFor: aPoint)) ]
		ifNotNil: [ :dragger | 
			dragger to: (self grabPointFor: aPoint).
			self changed ]