examples
example1
	"JunAtom example1"

	| form rc projection |
	form := Form extent: 500 @ 500 depth: 32.
	rc := form renderingContext.
	projection := JunPerspectiveProjection
		eyePoint: 10 _, 10 _, 15
		sightPoint: 0 _, 0 _, 0
		upVector: 0 _, 1 _, 0
		fovy: 30 asDegrees
		near: 0.1
		far: 100.0.
	rc projection: projection.
	rc enableCullface.
	rc clear.
	rc ambientLight: Color darkGray.
	rc lightIndex: 0 parallel: (10 _, 10 _, 15) negated color: Color white.
	(JunCarbon at: -1.1604 _, -0.6711 _, -0.0756) renderOn: rc.
	(JunCarbon at: -1.1621 _, 0.6709 _, -0.0461) renderOn: rc.
	(JunCarbon at: -0.0019 _, 1.3422 _, 0.0296) renderOn: rc.
	(JunCarbon at: 1.1596 _, 0.6708 _, 0.0756) renderOn: rc.
	(JunCarbon at: 1.1615 _, -0.6712 _, 0.0461) renderOn: rc.
	(JunCarbon at: 0.0012 _, -1.3423 _, -0.0296) renderOn: rc.
	(JunHydrogen at: -2.1144 _, -1.2230 _, -0.1378) renderOn: rc.
	(JunHydrogen at: -2.1172 _, 1.2228 _, -0.0839) renderOn: rc.
	(JunHydrogen at: -0.0032 _, 2.4459 _, 0.0539) renderOn: rc.
	(JunHydrogen at: 2.1138 _, 1.2225 _, 0.1378) renderOn: rc.
	(JunHydrogen at: 2.1172 _, -1.2230 _, 0.0840) renderOn: rc.
	(JunHydrogen at: 0.0024 _, -2.4459 _, -0.0539) renderOn: rc.
	rc flush.
	(Delay forMilliseconds: 100) wait.
	rc form asMorph openInWorld