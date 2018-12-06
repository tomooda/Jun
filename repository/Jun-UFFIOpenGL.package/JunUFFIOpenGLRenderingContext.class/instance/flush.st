displaying
flush
	forms first
		ifNotNil: [ :form | 
			form unhibernate.
			self
				activate: [ :gl | 
					gl
						finish;
						pixelStorei_pname: GL_PACK_ALIGNMENT param: 0;
						pixelStorei_pname: GL_PACK_ROW_LENGTH param: form extent x;
						pixelStorei_pname: GL_PACK_IMAGE_HEIGHT param: form extent y;
						pixelStorei_pname: GL_PACK_SKIP_PIXELS param: 0;
						pixelStorei_pname: GL_PACK_SKIP_ROWS param: 0;
						pixelStorei_pname: GL_PACK_SKIP_IMAGES param: 0;
						readPixels_x: 0
							y: 0
							width: form width
							height: form height
							format: GL_BGRA_EXT
							type: GL_UNSIGNED_BYTE
							pixels: form bits;
						finish ] ]