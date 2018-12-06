utilities
hemispherePoint: groundPoint center: centerPoint on: groundPlane
	"JunGeometry hemispherePoint: 1,0,0 center: 0,0,1 on: (0,0,0 plane: 1,0,0 and: 0,1,0)."

	^ (centerPoint to: (groundPlane nearestPointFromPoint: groundPoint)) normalized
		atT: (groundPlane distanceFromPoint: centerPoint)