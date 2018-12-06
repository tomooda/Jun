accessing
gl
	^ GL ifNil: [ GL := UFFIOpenGL new ]