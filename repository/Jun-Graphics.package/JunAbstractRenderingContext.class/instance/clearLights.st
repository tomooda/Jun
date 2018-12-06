lighting
clearLights
	1 to: lightIndex do: [:index | self disableLightIndex: index].
	self resetLightIndex