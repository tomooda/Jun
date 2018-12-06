initialize-release
initialize
	super initialize.
	self extent: self defaultExtent.
	projection := self defaultProjection.
	dirty := false