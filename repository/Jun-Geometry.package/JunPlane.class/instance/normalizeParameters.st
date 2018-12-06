private
normalizeParameters
	| max |
	max := (a abs max: b abs) max: c abs.
	a := a / max.
	b := b / max.
	c := c / max.
	d := d / max