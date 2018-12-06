bounds access
boundingBox
	^ bounds ifNil: [ bounds := self preferredBoundingBox ]