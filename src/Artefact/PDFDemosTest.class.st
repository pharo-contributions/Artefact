Class {
	#name : #PDFDemosTest,
	#superclass : #TestCase,
	#category : #'Artefact-Test'
}

{ #category : #'as yet unclassified' }
PDFDemosTest >> testAllDemos [
	PDFDemos class methods do: [ :m | PDFDemos perform: m selector ]
]
