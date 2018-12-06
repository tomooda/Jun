geometry
moleculePointToScreenPoint: aJun3dPoint
	^ (aJun3dPoint x * scale) @ (aJun3dPoint y * scale negated) + self bounds center