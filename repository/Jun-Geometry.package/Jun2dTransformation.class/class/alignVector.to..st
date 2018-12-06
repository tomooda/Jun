typical transformation
alignVector: aJun2dPoint1 to: aJun2dPoint2
	| zero |
	zero := Jun2dPoint zero.
	^ self
		alignPoints:
			(Array
				with: aJun2dPoint1 -> aJun2dPoint1
				with:
					(aJun2dPoint1 y negated _ , aJun2dPoint1 x)
						-> (aJun2dPoint2 y negated _ , aJun2dPoint2 x)
				with: zero -> zero)