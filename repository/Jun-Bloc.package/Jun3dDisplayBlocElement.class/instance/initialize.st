initialize-release
initialize
	super initialize.
	projection := self defaultProjection.
	self
		addEventHandlerOn: BlMouseDownEvent
		do: [ :event | dragger := self createDraggerFor: (self grabPointFor: event localPosition) ].
	self addEventHandlerOn: BlMouseUpEvent do: [ dragger := nil ].
	self
		addEventHandlerOn: BlMouseMoveEvent
		do: [ :event | 
			dragger
				ifNotNil: [ dragger to: (self grabPointFor: event localPosition).
					self invalidate ] ].
	self
		addEventHandlerOn: BlMouseWheelEvent
		do: [ :event | 
			event isScrollUp
				ifTrue: [ self
						zoomout;
						invalidate ].
			event isScrollDown
				ifTrue: [ self
						zoomin;
						invalidate ] ].
	self addEventHandlerOn: BlElementExtentChangedEvent do: [ self invalidate ].
	self addEventHandlerOn: BlSpaceResizedEvent do: [ self invalidate ]