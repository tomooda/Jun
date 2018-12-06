utilities
hemispherePoint: groundPoint center: centerPoint
	"JunGeometry hemispherePoint: 1_,0_,0 center: 0_,0_,1."

	^ self
		hemispherePoint: groundPoint
		center: centerPoint
		on: (0 _ , 0 _ , 0 plane: 1 _ , 0 _ , 0 and: 0 _ , 1 _ , 0)