private
fitDistance
	| factor |
	factor := self viewFactor.
	far := self distance * factor.
	near := self distance / factor