interface building
openInWindow
	"JunLauncher new openInWindow"

	| menuBar logo |
	menuBar := self menuBar.
	logo := self logo.
	self color: Color white.
	self extent: (logo width max: menuBar width) @ (logo height + menuBar height).
	self changeProportionalLayout.
	self
		addMorph: menuBar
		fullFrame: ((0 @ 0 corner: 1 @ 0) asLayoutFrame bottomRightOffset: (0 @ menuBar height)).
	self
		addMorph: logo
		fullFrame: ((0 @ 0 corner: 1 @ 1) asLayoutFrame topLeftOffset:  (0 @ menuBar height)).
	^ (self openInWindowLabeled: self class asString)
		beUnresizeable;
		yourself