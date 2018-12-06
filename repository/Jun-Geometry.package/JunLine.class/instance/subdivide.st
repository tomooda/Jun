subdividing
subdivide
	"(((0 , 0 to: 1 , 1) subdivide) showWithArrows) wireframePresentation."
	"(((0 , 0 , 0 to: 1 , 1 , 1) subdivide) showWithArrows) wireframePresentation."

	^ self polylineClass vertexes: (Array with: self from with: self center with: self to)