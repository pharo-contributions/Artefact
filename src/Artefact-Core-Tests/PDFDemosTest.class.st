Class {
	#name : #PDFDemosTest,
	#superclass : #TestCase,
	#category : #'Artefact-Core-Tests-Base'
}

{ #category : #tests }
PDFDemosTest >> testAllDemos [

	| demos |
	demos := PDFDemos new.
	PDFDemos methods do: [ :m |
		PDFDemos
			streamNamed: 'allDemos.pdf'
			do: [ :stream | demos perform: m selector with: stream ] ]
]
