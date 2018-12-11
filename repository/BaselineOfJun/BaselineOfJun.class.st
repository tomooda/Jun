Class {
	#name : #BaselineOfJun,
	#superclass : #BaselineOf,
	#category : #BaselineOfJun
}

{ #category : #baseline }
BaselineOfJun >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'UFFIOpenGL'
					with: [ spec repository: 'github://ronsaldo/uffi-opengl/tonel' ];
				baseline: 'OSSubprocess'
					with: [ spec repository: 'github://pharo-contributions/OSSubprocess/repository' ].
			spec
				package: 'Jun-Geometry';
				package: 'Jun-Graphics' with: [ spec requires: #('Jun-Geometry') ];
				package: 'Jun-System' with: [ spec requires: #('Jun-Geometry' 'Jun-Graphics') ];
				package: 'Jun-Tests' with: [ spec requires: #('Jun-Geometry' 'Jun-Graphics') ];
				package: 'Jun-Chemistry' with: [ spec requires: #('Jun-Geometry' 'Jun-Graphics') ];
				package: 'Jun-Chemistry-Babel'
					with: [ spec requires: #(#'Jun-Chemistry' 'OSSubprocess') ];
				package: 'Jun-UFFIOpenGL' with: [ spec requires: #('UFFIOpenGL') ];
				package: 'Jun-GT' with: [ spec requires: #('Jun-Graphics') ].
			spec
				group: 'Core' with: #('Jun-System' 'Jun-UFFIOpenGL' 'Minimal');
				group: 'Minimal' with: #('Jun-Geometry' 'Jun-Graphics');
				group: 'default' with: #('Jun-Tests' 'Core' 'Chemistry' 'Jun-GT');
				group: 'Chemistry' with: #(#'Jun-Chemistry' 'Core');
				group: 'Chemistry-Full' with: #('Chemistry' 'Jun-Chemistry-Babel') ]
]
