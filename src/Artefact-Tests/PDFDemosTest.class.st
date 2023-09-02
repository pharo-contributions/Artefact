Class {
	#name : #PDFDemosTest,
	#superclass : #TestCase,
	#category : #'Artefact-Tests-Base'
}

{ #category : #tests }
PDFDemosTest >> testAllDemos [
	| demos |
	demos := PDFDemos new.
	PDFDemos methods do: [ :m | demos perform: m selector with: (PDFDemos streamNamed: 'allDemos.pdf') ]
]
