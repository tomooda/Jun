utilities
translateTo3dLineFromPoint: aPoint
	| from to |
	from := self translateTo3dPointFromPoint: aPoint depth: self near.
	to := self translateTo3dPointFromPoint: aPoint depth: self far.
	^ Jun3dLine from: from to: to