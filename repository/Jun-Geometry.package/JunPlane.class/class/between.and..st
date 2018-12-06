instance creation
between: aPoint1 and: aPoint2
	"JunPlane between: (0 , 0 , 0) and: (1 , 1 , 1)."

	| centerPoint |
	centerPoint := aPoint1 center: aPoint2.
	^ self on: centerPoint vertical: (aPoint1 to: aPoint2)