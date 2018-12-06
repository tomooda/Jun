initialize-release
initialize
	super initialize.
	maxPeriod := self defaultMaxPeriod.
	font := TextStyle default defaultFont.
	self adjustExtent