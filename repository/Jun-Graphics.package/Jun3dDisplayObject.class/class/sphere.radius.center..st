typical objects - spheres
sphere: degrees radius: radius center: center
	"(Jun3dDisplayObject sphere: 15 radius: 5 center: 1, 1, 1) show."

	^ (Jun3dTransformation translate: center) applyTo: (self sphere: degrees radius: radius)