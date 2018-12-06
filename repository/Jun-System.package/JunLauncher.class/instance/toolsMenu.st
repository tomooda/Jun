menus
toolsMenu
	| menu |
	menu := MenuMorph new defaultTarget: self.
	menu add: 'reopen launcher' translated target: self class selector: #reopen.
	^ menu popUpInWorld