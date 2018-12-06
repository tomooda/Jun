typical objects - spheres
sphere: degrees radius: radius longitude: logitude latitude: latitude
	^ (self
		xyPointsAndSphere: degrees
		radius: radius
		longitude: logitude
		latitude: latitude) last