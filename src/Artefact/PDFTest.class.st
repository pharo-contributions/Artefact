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
	aPage add: (PDFFontStyle new family: 'Arial'; fontSize: 16; bold: true).
	aPage add: (PDFCellStyle new wh: 40@10; text: 'Hello World!').
	pdfdoc add: aPage.
	Transcript clear; show: pdfdoc generate.
	
	
]
