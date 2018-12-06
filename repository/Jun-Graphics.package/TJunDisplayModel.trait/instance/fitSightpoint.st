operations
fitSightpoint
	self object ifNotNil: [ :obj | self fitSightpointToBoundingBox: obj boundingBox ]