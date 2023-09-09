"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestArtefactCoreTests,
	#superclass : #PackageManifest,
	#category : #'Artefact-Core-Tests-Manifest'
}

{ #category : #'code-critics' }
ManifestArtefactCoreTests class >> ruleCollectionProtocolRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#PDFStreamPrinterTest #testGenerateGZipCompression #false)) #'2023-09-10T00:13:22.863+02:00') )
]

{ #category : #'code-critics' }
ManifestArtefactCoreTests class >> ruleLiteralArrayContainsSuspiciousTrueFalseOrNilRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMetaclassDefinition #(#'ManifestArtefactCoreTests class' #ManifestArtefactCoreTests)) #'2023-09-10T00:13:40.462+02:00') )
]
