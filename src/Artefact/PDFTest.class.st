Class {
	#name : #PDFTest,
	#superclass : #Object,
	#category : #Artefact
}

{ #category : #'as yet unclassified' }
PDFTest class >> demo [
	"a simple demonstration of Artefact"
	
	| pdfdoc myFont myBigFont aPage |
	pdfdoc := PDFDocument new.	

	myFont := PDFFontStyle new family: 'helvetica'; fontSize: 16.
	myBigFont := PDFFontStyle new family: 'helvetica'; fontSize: 64.
	
	aPage := PDFPage new.
	aPage add: myBigFont.
	aPage add: (PDFCellStyle new wh: 100@24; border: true; linefeed: true; text: 'Artefact').
	aPage add: myFont.
	aPage add: (PDFCellStyle new wh: 100@10; border: true; linefeed: true; text: 'PDF Framework for Pharo').	
	pdfdoc add: aPage.
	
	pdfdoc exportToFile: '/Users/olivier/Desktop/demo.pdf'.
]

{ #category : #'as yet unclassified' }
PDFTest class >> ex1 [
	"generate a sample document"

	"PDFTest ex1"
	
	| pdfdoc aPage aSecondPage |
	pdfdoc := PDFDocument new.
	pdfdoc setFormat: PDFA3Format new.
	pdfdoc setLandscape.
	
	pdfdoc title: 'Le titre du document'.
	
	aPage := PDFPage new.
	aPage add: (PDFFontStyle new family: 'times'; fontSize:32; bold: true).
	aPage add: (PDFCellStyle new wh: 40@10; border: true; linefeed: false; text: 'Hello world!').
	aPage add: (PDFCellStyle new wh: 40@10; border: true; linefeed: true; text: 'at right').
	aPage add: (PDFCellStyle new wh: 40@10; border: true; linefeed: true; text: 'Second line').
	aPage add: (PDFCellStyle new wh: 40@10; border: true; linefeed: true; text: 'Third line').
	pdfdoc add: aPage.
	
	"aSecondPage := PDFPage new.
	aSecondPage add: (PDFLineStyle new xy: 80@80; destination: 100@100).
	aSecondPage add: (PDFRectStyle new xy: 30@30; wh: 40@40).
	pdfdoc add: aSecondPage."
	
	
	pdfdoc exportToFile: '/Users/olivier/Desktop/essai.pdf'.

	
	
]

{ #category : #'as yet unclassified' }
PDFTest class >> infos [
	"generate a sample document with informations"

	"PDFTest infos"
	
	| pdfdoc aPage aSecondPage |
	pdfdoc := PDFDocument new.
	
	pdfdoc title: 'Le titre du document'; 
		subject: 'test de la zone d''information'; 
		author: 'Olivier Auverlot'; 
		keywords: 'test zone infos';
		creator: 'Artefact - Pharo'.
	
	aPage := PDFPage new.
	
	pdfdoc add: aPage.
	pdfdoc exportToFile: '/Users/olivier/Desktop/infos.pdf'.

	
	
]

{ #category : #'as yet unclassified' }
PDFTest class >> widthTest [
	"generate a sample document for testing the width of fonts"

	"PDFTest widthTest"
	
	| pdfdoc aPage myFont myBigFont width text size |

	pdfdoc := PDFDocument new.	
			
	myFont := PDFFontStyle new family: 'times'; fontSize: 16.
	myBigFont := PDFFontStyle new family: 'times'; fontSize: 1.
	text := 'Hello world !'.

	myBigFont fontSize: (pdfdoc getIdealFontSizeOfString: 'Hello world!' width: 100 with: myBigFont)..	

	aPage := PDFPage new.
	aPage add: (PDFCellStyle new wh: 100@32; border: true; linefeed: true; text: 'Une première ligne').
	
	aPage add: myFont.
	width := pdfdoc getStringWidth: text with: myFont.
	aPage add: (PDFCellStyle new wh: width@10; border: true; linefeed: true; text: text).

	aPage add: myBigFont.
	aPage add: (PDFCellStyle new wh: 100@10; border: true; linefeed: true; text: text).
	
	Transcript show: pdfdoc margins asString.
	aPage add: (PDFLineStyle new xy: 10@60; destination: 110@60).
	pdfdoc add: aPage.
	
	pdfdoc exportToFile: '/Users/olivier/Desktop/essai.pdf'.

	
	
]
