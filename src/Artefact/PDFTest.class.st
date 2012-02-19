Class {
	#name : #PDFTest,
	#superclass : #Object,
	#category : #Artefact
}

{ #category : #'as yet unclassified' }
PDFTest class >> ex1 [
	"generate a sample document"

	"PDFTest ex1"
	
	| pdfdoc aPage aSecondPage |
	pdfdoc := PDFDocument new.
"pdfdoc setLandscape."
	aPage := PDFPage new.
	aPage add: (PDFFontStyle new family: 'Arial'; fontSize: 16; bold: true).
	aPage add: (PDFCellStyle new wh: 40@10; border: false; linefeed: false; text: 'Hello world!').
	aPage add: (PDFCellStyle new wh: 40@10; border: false; linefeed: false; text: 'Cool Raoul').
	pdfdoc add: aPage.
	
	aSecondPage := PDFPage new.
	aSecondPage add: (PDFLineStyle new xy: 80@80; destination: 100@100).
	aSecondPage add: (PDFRectStyle new xy: 30@30; wh: 40@40).
	pdfdoc add: aSecondPage.
	
	pdfdoc exportToFile: '/Users/olivier/Desktop/essai.pdf'.

	
	
]
