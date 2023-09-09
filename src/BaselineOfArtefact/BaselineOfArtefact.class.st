"
Baseline for [https://github.com/pharo-contributions/Artefact](https://github.com/pharo-contributions/Artefact)
"
Class {
	#name : #BaselineOfArtefact,
	#superclass : #BaselineOf,
	#category : #'BaselineOfArtefact-Base'
}

{ #category : #baselines }
BaselineOfArtefact >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		"Dependencies"
		self
			heimdall: spec;
			materialDesignLite: spec;
			stylesheet: spec;
			units: spec.

		"Packages"
		spec
			package: 'Artefact-Core'
			with: [ spec requires: #( 'Units' 'Stylesheet' ) ];
			package: 'Artefact-Examples'
			with: [ spec requires: #( 'Artefact-Core' ) ];
			package: 'Artefact-Core-Tests'
			with: [ spec requires: #( 'Artefact-Core' 'Artefact-Examples' ) ];
			package: 'Artefact-Seaside'
			with: [
				spec requires: #( 'default' 'Heimdall' 'MaterialDesignLite' ) ].

		"Pharo 6- compatibility"
		spec
			for:
				#( #'pharo1.x' #'pharo2.x' #'pharo3.x' #'pharo4.x' #'pharo5.x'
				   #'pharo6.x' )
			do: [
				spec
					package: 'Artefact-Pharo60-Compatibility';
					package: 'Artefact-Examples'
					with: [
						spec requires:
								#( 'Artefact-Core' 'Artefact-Pharo60-Compatibility' ) ] ].

		"Groups"
		spec			
			group: 'Core' with: #('Artefact-Core');
			group: 'Tests' with: #('Artefact-Core-Tests');
			group: 'Examples' with: #('Artefact-Examples');
			group: 'Seaside' with: #('Artefact-Seaside');
			group: 'CI' with: #('Tests');
			group: 'default' with: #('Core' 'Tests' 'Examples');
			group: 'all' with: #('default' 'Seaside') ]
]

{ #category : #dependencies }
BaselineOfArtefact >> heimdall: spec [
	spec baseline: 'Heimdall' with: [ spec repository: 'github://DuneSt/Heimdall:v1.x.x/src' ]
]

{ #category : #dependencies }
BaselineOfArtefact >> materialDesignLite: spec [
	spec baseline: 'MaterialDesignLite' with: [ spec repository: 'github://DuneSt/MaterialDesignLite:v2.x.x/src' ]
]

{ #category : #accessing }
BaselineOfArtefact >> projectClass [
	^ [ self class environment at: #MetacelloCypressBaselineProject ]
		on: NotFound
		do: [ super projectClass ]
]

{ #category : #dependencies }
BaselineOfArtefact >> stylesheet: spec [
	spec baseline: 'Stylesheet' with: [ spec repository: 'github://pharo-contributions/Stylesheet:v1.x.x/src' ]
]

{ #category : #dependencies }
BaselineOfArtefact >> units: spec [
	spec baseline: 'Units' with: [ spec repository: 'github://zweidenker/Units/src' ]
]
