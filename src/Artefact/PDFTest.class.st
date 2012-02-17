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
	aPage add: (PDFCellStyle new wh: 40@10; border: true; linefeed: true; text: 'Artefact PDF Framework').
	aPage add: (PDFLineStyle new xy: 80@80; destination: 100@100).
	aPage add: (PDFRectStyle new xy: 30@30; wh: 40@40).

	aPage add: (PDFCellStyle new wh: 100@30; border: true; text: 'Une autre case').
	pdfdoc add: aPage.
	
	pdfdoc exportToFile: '/Users/olivier/Desktop/essai.pdf'.

	
	
]
