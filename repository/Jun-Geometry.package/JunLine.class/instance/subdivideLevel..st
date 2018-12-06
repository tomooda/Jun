subdividing
subdivideLevel: levelNumber
	"(((0 , 0 to: 1 , 1) subdivideLevel: 0) showWithArrows) wireframePresentation."
	"(((0 , 0 to: 1 , 1) subdivideLevel: 1) showWithArrows) wireframePresentation."
	"(((0 , 0 to: 1 , 1) subdivideLevel: 2) showWithArrows) wireframePresentation."
	"(((0 , 0 , 0 to: 1 , 1 , 1) subdivideLevel: 0) showWithArrows) wireframePresentation."
	"(((0 , 0 , 0 to: 1 , 1 , 1) subdivideLevel: 1) showWithArrows) wireframePresentation."
	"(((0 , 0 , 0 to: 1 , 1 , 1) subdivideLevel: 2) showWithArrows) wireframePresentation."

	| polyline |
	polyline := self asPolyline.
	levelNumber timesRepeat: [ polyline := polyline subdivide ].
	^ polyline