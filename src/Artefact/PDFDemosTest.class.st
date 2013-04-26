Class {
	#name : #PDFDemosTest,
	#superclass : #TestCase,
	#category : #'Artefact-Test'
}

{ #category : #'as yet unclassified' }
PDFDemosTest >> testAllDemos [
	| demos |
	demos := PDFDemos new.
	PDFDemos methods do: [ :m | demos perform: m selector with: (MultiByteBinaryOrTextStream on: String new) ]
]
