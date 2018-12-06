drawing
drawQuarterVanDerWaalsOn: aCanvas at: aPoint scale: pixelsPerÅngströms
	(atoms asSortedCollection: [ :deeper :shallower | deeper position z <= shallower position z ])
		do: [ :atom | atom drawQuarterVanDerWaalsOn: aCanvas at: aPoint scale: pixelsPerÅngströms ]