event handling
mouseWheel: aMouseEvent
	((aMouseEvent respondsTo: #isUp)
		ifTrue: [ aMouseEvent isUp ]
		ifFalse: [ aMouseEvent direction = #up ])
		ifTrue: [ aMouseEvent wasHandled: true.
			self zoomin.
			^ self delayedChanged ].
	((aMouseEvent respondsTo: #isDown)
		ifTrue: [ aMouseEvent isDown ]
		ifFalse: [ aMouseEvent direction = #down ])
		ifTrue: [ aMouseEvent wasHandled: true.
			self zoomout.
			^ self delayedChanged ].
	super mouseWheel: aMouseEvent