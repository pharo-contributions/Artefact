"
(ConfigurationOfArtefact project version: #stable) load


!! 2013-08-10 cleaning the configuration

(ConfigurationOfArtefact project version: '1.1') load


!! Version 1.0 release
(ConfigurationOfArtefact project version: '1.0') load

"
Class {
	#name : #ConfigurationOfArtefact,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : #ConfigurationOfArtefact
}

{ #category : #'development support' }
ConfigurationOfArtefact class >> DevelopmentSupport [

"See the methods in the 'development support' category on the class-side of MetacelloBaseConfiguration. Decide what development support methods you would like to use and copy them the the class-side of your configuration."
	<apiDocumentation>

]

{ #category : #private }
ConfigurationOfArtefact class >> baseConfigurationClassIfAbsent: aBlock [

	^Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			self ensureMetacelloBaseConfiguration.
			Smalltalk at: #MetacelloBaseConfiguration ifAbsent: aBlock ].

]

{ #category : #catalog }
ConfigurationOfArtefact class >> catalogChangeLog [

	^ '- Version: 1.1 2013-08-10 cleaning the configuration
[[[	
	(ConfigurationOfArtefact project version: ''1.1'') load
]]]
- Version 1.0 release of Artefact
[[[ 
	(ConfigurationOfArtefact project version: ''1.0'') load
]]]
'
]

{ #category : #catalog }
ConfigurationOfArtefact class >> catalogDescription [

	^ 'Artefact is a library to generate PDF documents. It provides a document model and support the generation of PDF'
]

{ #category : #catalog }
ConfigurationOfArtefact class >> catalogKeyClassesAndExample [

^ '
	==PDFDocument== is a central class that represents a document. 
	
	==PDFDemos== is a class containing many examples. You can execute them all by ==PDFDemos runAllDemos==. It generates all the examples in a folder.
	
	==PDFTemplate== represents the page template. Its subclasses represent some predefined pages format.
	
'
]

{ #category : #catalog }
ConfigurationOfArtefact class >> catalogKeywords [

	^ #(PDF layout document)
]

{ #category : #private }
ConfigurationOfArtefact class >> ensureMetacello [

	(self baseConfigurationClassIfAbsent: []) ensureMetacello
]

{ #category : #private }
ConfigurationOfArtefact class >> ensureMetacelloBaseConfiguration [

	Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			| repository version |
			repository := MCHttpRepository location: 'http://seaside.gemstone.com/ss/metacello' user: '' password: ''.
			repository
				versionReaderForFileNamed: 'Metacello-Base-DaleHenrichs.2.mcz'
				do: [ :reader | 
					version := reader version.
					version load.
					version workingCopy repositoryGroup addRepository: repository ] ]
]

{ #category : #'metacello tool support' }
ConfigurationOfArtefact class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #loading }
ConfigurationOfArtefact class >> load [
	"Load the #stable version defined for this platform. The #stable version is the version that is recommended to be used on this platform."

	"self load"

	<apiDocumentation>
	^(self project version: #stable) load
]

{ #category : #loading }
ConfigurationOfArtefact class >> loadBleedingEdge [
	"Load the latest versions of the mcz files defined for this project. It is not likely that the #bleedingEdge has been tested."

	"self loadBleedingEdge"

	<apiDocumentation>
	^(self project version: #bleedingEdge) load
]

{ #category : #loading }
ConfigurationOfArtefact class >> loadDevelopment [
	"Load the #development version defined for this platform. The #development version will change over time and is not expected to be stable."

	"self loadDevelopment"

	<apiDocumentation>
	^(self project version: #development) load
]

{ #category : #accessing }
ConfigurationOfArtefact class >> project [

	^self new project
]

{ #category : #'development support' }
ConfigurationOfArtefact class >> validate [
	"Check the configuration for Errors, Critical Warnings, and Warnings (see class comment for MetacelloMCVersionValidator for more information). 
	Errors identify specification issues that will result in unexpected behaviour when you load the configuration. 
	Critical Warnings identify specification issues that may result in unexpected behavior when you load the configuration.
	Warnings identify specification issues that are technically correct, but are worth take a look at."

	"self validate"

	<apiDocumentation>
	self ensureMetacello.
	^ ((Smalltalk at: #MetacelloToolBox) validateConfiguration: self debug: #() recurse: false) explore
]

{ #category : #accessing }
ConfigurationOfArtefact >> baseline09: spec [
	<version: '0.9-baseline'>
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
			spec repository: 'http://www.squeaksource.com/Units'.
			spec
				package: 'Units' with: 'Units-espin.36'.
			spec repository: 'http://smalltalkhub.com/mc/RMoD/Artefact/main'.
			spec
				package: 'Artefact']
]

{ #category : #accessing }
ConfigurationOfArtefact >> baseline10: spec [
	<version: '1.0-baseline'>
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
			spec repository: 'http://smalltalkhub.com/mc/MarcusDenker/Units/main'.
			spec
				package: 'Units' with: 'Units-espin.36'.
			spec repository: 'http://smalltalkhub.com/mc/RMoD/Artefact/main'.
			spec
				package: 'Artefact']
]

{ #category : #accessing }
ConfigurationOfArtefact >> baseline11: spec [
	<version: '1.1-baseline'>
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
			spec author: 'Olivier Auverlot and Guillaume Larcheveque'.
			spec timestamp: '10/08/2013'.
			spec repository:  'http://smalltalkhub.com/mc/RMoD/Artefact/main'.
			
			spec package: 'Artefact' with: [ spec requires: 'Units' ].
			spec
				project: 'Units'
				with: [ 
					spec
						className: 'ConfigurationOfUnits';
						file: 'ConfigurationOfUnits';
						version: '1.0-baseline';
						 repository: 'http://smalltalkhub.com/mc/MarcusDenker/Units/main'] ]
]

{ #category : #accessing }
ConfigurationOfArtefact >> customProjectAttributes [
	 "Edit to return a collection of any custom attributes e.g. for conditional loading: Array with: #'Condition1' with: #'Condition2.
	For more information see: http://code.google.com/p/metacello/wiki/CustomProjectAttrributes"

	^ #().
]

{ #category : #accessing }
ConfigurationOfArtefact >> development: spec [
	<symbolicVersion: #'development'>

	spec for: #'common' version: '1.1-baseline'.

]

{ #category : #accessing }
ConfigurationOfArtefact >> project [

	^ project ifNil: [ | constructor |
		"Bootstrap Metacello if it is not already loaded"
		(self class baseConfigurationClassIfAbsent: []) ensureMetacello.
		"Construct Metacello project"
		project := MetacelloMCProject new projectAttributes: self customProjectAttributes. 
		constructor := (Smalltalk at: #MetacelloVersionConstructor) on: self project: project.
		project loadType: #linear. "change to #atomic if desired"
		project ]
]

{ #category : #accessing }
ConfigurationOfArtefact >> repositoryUrlString [
	^ 'http://smalltalkhub.com/mc/RMoD/Artefact/main'
]

{ #category : #accessing }
ConfigurationOfArtefact >> stable: spec [
	<symbolicVersion: #'stable'>

	spec for: #'common' version: '1.1'.

]

{ #category : #accessing }
ConfigurationOfArtefact >> version09: spec [
	<version: '0.9' imports: #('0.9-baseline')>
	
	spec for: #common do: [
		spec
			blessing: #stable;
			author: 'Olivier Auverlot and Guillaume Larcheveque';
			description: 'configuration for artefact'.
		spec
			package: 'Artefact' with: 'Artefact-GuillaumeLarcheveque.194'.
	]
]

{ #category : #accessing }
ConfigurationOfArtefact >> version10: spec [
	<version: '1.0' imports: #('1.0-baseline')>
	
	spec for: #common do: [
		spec
			blessing: #stable;
			author: 'Olivier Auverlot and Guillaume Larcheveque';
			description: 'configuration for artefact'.
		spec
			package: 'Artefact' with: 'Artefact-GuillaumeLarcheveque.230'.
	]
]

{ #category : #accessing }
ConfigurationOfArtefact >> version11: spec [
	<version: '1.1' imports: #('1.1-baseline')>
	
	spec for: #common do: [
		spec
			blessing: #stable;
			author: 'Olivier Auverlot and Guillaume Larcheveque';
			description: 'Configuration for artefact'.
		spec package: 'Artefact' with: 'Artefact-GuillaumeLarcheveque.230'.
		spec project: 'Units' with: '1.1'
	]
]
