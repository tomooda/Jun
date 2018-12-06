initialize-release
initialize
	super initialize.
	lights := Array new: self maxLightIndex + 1.
	lightStates := IdentityDictionary new.
	self projection: self defaultProjection.
	transformation := Jun3dTransformation unity.
	color := self defaultColor.
	lineWidth := self defaultLineWidth.
	pointSize := self defaultPointSize.
	self disableCullface.
	self solidPresentation.
	self resetLightIndex