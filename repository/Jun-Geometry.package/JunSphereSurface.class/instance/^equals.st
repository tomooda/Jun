comparing
= sphereSurface 
	self class == sphereSurface class ifFalse: [^false].
	^self radius = sphereSurface radius 
		and: [self center = sphereSurface center]