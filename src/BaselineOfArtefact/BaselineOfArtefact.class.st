Class {
	#name : #BaselineOfArtefact,
	#superclass : #BaselineOf,
	#category : #BaselineOfArtefact
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
			package: 'Artefact-Tests'
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
					package: 'Artefact-Pharo6Compatibility';
					package: 'Artefact-Examples'
					with: [
						spec requires:
								#( 'Artefact-Core' 'Artefact-Pharo6Compatibility' ) ] ].

		"Groups"
		spec
			group: 'default' with: #( 'core' 'tests' 'examples' );
			group: 'core' with: #( 'Artefact-Core' );
			group: 'tests' with: #( 'Artefact-Tests' );
			group: 'examples' with: #( 'Artefact-Examples' );
			group: 'seaside' with: #( 'Artefact-Seaside' ) ]
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
