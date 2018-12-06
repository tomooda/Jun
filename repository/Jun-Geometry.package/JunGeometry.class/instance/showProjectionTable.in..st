viewing
showProjectionTable: aDictionary in: aRectangle
	"(1 , 1 , 1 cylinder: 1 height: 2) 
		showProjectionTable: (Dictionary new
			add: #presentation -> #solidPresentation;
			add: #sightPoint -> (0.0d , 0.0d , 0.0d);
			add: #eyePoint -> (8.9144349065121d , 5.018580708957d , 6.2726946335082d);
			add: #shading -> #flatShading;
			add: #upVector -> (-0.29701438733281d , -0.49387349075548d , 0.81723401106801d);
			add: #viewFactor -> 10;
			add: #zoomHeight -> 3.9191837441874d;
			yourself) 
		in: (200 @ 200 extent: 400 @ 200)."

	^ self asJunOpenGL3dObject showProjectionTable: aDictionary in: aRectangle