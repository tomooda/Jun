texture mapping
withTexture: aJunTexture do: aBlock
	self
		activate: [ :gl | 
			| textureName |
			textureName := textures
				at: aJunTexture
				ifAbsentPut: [ | name |
					gl pixelStorei_pname: GL_UNPACK_ALIGNMENT param: 1.
					name := ByteArray new: 64.
					gl genTextures_n: 1 textures: name.
					gl
						bindTexture_target: GL_TEXTURE_2D texture: (name unsignedLongAt: 1);
						texParameteri_target: GL_TEXTURE_2D pname: GL_TEXTURE_WRAP_S param: GL_REPEAT;
						texParameteri_target: GL_TEXTURE_2D pname: GL_TEXTURE_WRAP_T param: GL_REPEAT;
						texParameteri_target: GL_TEXTURE_2D pname: GL_TEXTURE_MIN_FILTER param: GL_NEAREST;
						texParameteri_target: GL_TEXTURE_2D pname: GL_TEXTURE_MAG_FILTER param: GL_NEAREST;
						texImage2D_target: GL_TEXTURE_2D
							level: 0
							internalformat: GL_RGBA
							width: aJunTexture width
							height: aJunTexture height
							border: 0
							format: GL_RGBA
							type: GL_UNSIGNED_BYTE
							pixels: aJunTexture bytes.
					name ].
			gl
				enable: GL_TEXTURE_2D;
				texEnvf_target: GL_TEXTURE_ENV pname: GL_TEXTURE_ENV_MODE param: GL_DECAL;
				bindTexture_target: GL_TEXTURE_2D texture: (textureName unsignedLongAt: 1) ].
	^ aBlock
		ensure: [ self
				activate: [ :gl | 
					gl
						end;
						disable: GL_TEXTURE_2D ] ]