functions
distanceFromLine: aLine
	"(0 , 0 , 0 to: 1 , 1 , 1) distanceFromLine: (1 , 0 , 1 to: 0 , -1 , 1)."

	| theLine dx dy dz fg gh hf denominator |
	(aLine isKindOf: self class)
		ifTrue: [ theLine := aLine ]
		ifFalse: [ theLine := Jun3dLine from: aLine first to: aLine last ].
	dx := theLine x0 - x0.
	dy := theLine y0 - y0.
	dz := theLine z0 - z0.
	fg := f * theLine g - (theLine f * g).
	gh := g * theLine h - (theLine g * h).
	hf := h * theLine f - (theLine h * f).
	denominator := fg squared + gh squared + hf squared.
	denominator < self class accuracy
		ifTrue: [ ^ self distanceFromPoint: theLine from ].
	denominator := denominator sqrt.
	^ (dx * gh + (dy * hf) + (dz * fg)) abs / denominator