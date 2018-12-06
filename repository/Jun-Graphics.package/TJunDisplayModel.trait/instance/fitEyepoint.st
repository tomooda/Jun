operations
fitEyepoint
	self object ifNotNil: [ :obj | self fitEyepointToBoundingBox: obj boundingBox ]