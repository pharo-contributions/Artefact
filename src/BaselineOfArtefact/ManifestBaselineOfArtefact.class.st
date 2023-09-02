"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestBaselineOfArtefact,
	#superclass : #PackageManifest,
	#category : #'BaselineOfArtefact-Manifest'
}

{ #category : #'code-critics' }
ManifestBaselineOfArtefact class >> ruleClassNotReferencedRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGClassDefinition #(#BaselineOfArtefact)) #'2023-09-02T23:14:27.096+02:00') )
]
