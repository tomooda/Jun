converting
asRectangle
	"(100 , 200 extent: 400 , 300) asRectangle."
	"(100 , 200 , 300 extent: 400 , 300 , 200) asRectangle."

	^ Rectangle origin: self asPoint corner: self asPoint