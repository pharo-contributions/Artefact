Class {
	#name : #PDFTest,
	#superclass : #Object,
	#category : #Artefact
}

{ #category : #'as yet unclassified' }
PDFTest class >> ex1 [
	"generate a sample document"

	"PDFTest ex1"
	| pdfdoc aPage |
	pdfdoc := PDFDocument new.
	aPage := PDFPage new.
	aPage add: (PDFLineStyle new xy: 10@10; destination: 100@100).
	pdfdoc add: aPage.
	Transcript clear; show: pdfdoc generate.
	
	
]
