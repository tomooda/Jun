viewing
zoomin
	self projection
		in: [ :projection | 
			projection
				eyePoint: (projection eyePoint - projection sightPoint) * 1.01 + projection sightPoint ]