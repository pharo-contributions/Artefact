"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestArtefactCore,
	#superclass : #PackageManifest,
	#category : #'Artefact-Core-Manifest'
}

{ #category : #'code-critics' }
ManifestArtefactCore class >> ruleBadMessageRule2V1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#PDFColor #= #false)) #'2023-09-03T00:55:18.301+02:00') )
]

{ #category : #'code-critics' }
ManifestArtefactCore class >> ruleUtilityMethodsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#PDFDataDateAndTime #formatDate:time: #false)) #'2023-09-03T00:54:48.074+02:00') #(#(#RGMethodDefinition #(#PDFDataString #escape: #false)) #'2023-09-03T00:55:03.536+02:00') #(#(#RGMethodDefinition #(#PDFText #escape: #false)) #'2023-09-03T00:56:10.972+02:00') #(#(#RGMethodDefinition #(#PDFGenerator #convertToPoints: #false)) #'2023-09-03T00:56:22.089+02:00') #(#(#RGMethodDefinition #(#PDFStreamPrinter #initColors:useDrawColor: #false)) #'2023-09-03T00:56:32.953+02:00') #(#(#RGMethodDefinition #(#PDFGenerator #generatePDFFormat: #false)) #'2023-09-03T00:56:45.706+02:00') #(#(#RGMethodDefinition #(#PDFBasic #splitCoordinates: #false)) #'2023-09-03T00:56:59.728+02:00') #(#(#RGMethodDefinition #(#PDFStreamPrinter #getGZipData: #false)) #'2023-09-03T00:57:10.284+02:00') #(#(#RGMethodDefinition #(#PDFGenerator #generatePDFVersion: #false)) #'2023-09-03T00:57:18.54+02:00') #(#(#RGMethodDefinition #(#PDFBasic #determinePosition:on: #false)) #'2023-09-03T00:57:28.877+02:00') #(#(#RGMethodDefinition #(#PDFDataTableElement #calculateMinimumDimensionsForCells:withGenerator:styleSheet: #false)) #'2023-09-03T00:57:41.128+02:00') )
]
