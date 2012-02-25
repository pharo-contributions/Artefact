Class {
	#name : #PDFTest,
	#superclass : #Object,
	#category : #Artefact
}

{ #category : #'as yet unclassified' }
PDFTest class >> alignments [
	"a simple demonstration of Artefact"
	
	"PDFTest alignments"
	
	| pdfdoc myFont myBigFont aPage |
	pdfdoc := PDFDocument new.	

	myFont := PDFHelveticaFont new fontSize: 16.
	
	aPage := PDFPage new.

	aPage add: (PDFCellStyle new 
		font: myFont; 
		wh: 150@10; 
		border: true; 
		linefeed: true; 
		text: 'At left'
	).
	aPage add: (PDFCellStyle new 
		font: myFont; 
		wh: 150@10; 
		border: true; 
		linefeed: true; 
		text: 'Center'; 
		alignToCenter
	).
	aPage add: (PDFCellStyle new 
		font: myFont; 
		wh: 150@10; 
		border: true; 
		linefeed: true; 
		text: 'At right'; 
		alignToTheRight
	).
	pdfdoc add: aPage.
	
	pdfdoc exportToFile: '/Users/olivier/Desktop/alignments.pdf'.
]

{ #category : #'as yet unclassified' }
PDFTest class >> colorTest [
	"generate a sample document with colors"

	"PDFTest colorTest"
	
	| pdfdoc aPage myFont |
	pdfdoc := PDFDocument new.
	
	aPage := PDFPage new.
	aPage add: (PDFCellStyle new 
		font: (PDFTimesFont new fontSize: 32);
		wh: 100@20; 
		border: true; 
		text: 'Hello World!';
		ink: (PDFColor new setColor: #(255 0 0) );
		fillColor: (PDFColor new setColor: #(0 255 0))
		).
	aPage add: (PDFTextStyle new 
		xy: 70@100; 
		text: 'Another text'; 
		font: (PDFCourierFont new);
		ink: (PDFColor new setGreyLevel: 128)
		).

	aPage add: (PDFRectStyle new 
		xy: 0@80;
		wh: 50@50; 
		width: 5;
		ink: (PDFColor new setColor: #(0 0 255));
		fillColor: (PDFColor new setColor: #(0 255 0))
		).
		
	aPage add: (PDFRectStyle new 
		xy: 0@135;
		wh: 50@50; 
		width: 5;
		ink: (PDFColor new setGreyLevel: 196);
		fillColor: (PDFColor new setGreyLevel: 164)
		).
		
	pdfdoc add: aPage.
	
	pdfdoc exportToFile: '/Users/olivier/Desktop/colorTest.pdf'.

]

{ #category : #'as yet unclassified' }
PDFTest class >> demo [
	"a simple demonstration of Artefact"
	
	"PDFTest demo"
	
	| pdfdoc myFont myBigFont aPage |
	pdfdoc := PDFDocument new.	

	myBigFont := PDFCourierFont new fontSize: 64; bold: true.
	myFont := PDFHelveticaFont new fontSize: 16.
	
	aPage := PDFPage new.
	aPage add: (PDFCellStyle new font: myBigFont; wh: 100@24; border: true; linefeed: true; text: 'Artefact').
	aPage add: (PDFCellStyle new font: myFont; wh: 100@10; border: true; linefeed: true; text: 'PDF Framework for Pharo').
	pdfdoc add: aPage.
	
	pdfdoc exportToFile: '/Users/olivier/Desktop/demo.pdf'.
]

{ #category : #'as yet unclassified' }
PDFTest class >> drawTest [
	"generate a sample document for testing the draw objects"

	"PDFTest drawTest"
	
	| pdfdoc aPage width xy1 xy2 |

	pdfdoc := PDFDocument new.	
	aPage := PDFPage new.
	width := 1.
	xy1 := 10@20.
	xy2 := 100@20.
	
	1 to: 5 do: [ :i |
		aPage add: (PDFLineStyle new xy: xy1; destination: xy2; width: i).
		xy1 := (xy1 x) @ (xy1 y + 10).
		xy2 := (xy2 x) @ (xy2 y + 10).
	].	
	
	aPage add: (PDFRectStyle new 
		xy: 50@80;
		wh: 50@50; 
		width: 5
		).
	
	pdfdoc add: aPage.
	
	pdfdoc exportToFile: '/Users/olivier/Desktop/drawTest.pdf'.

	
	
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
	aPage add: (PDFCellStyle new wh: 40@10; border: true; linefeed: false; text: 'Hello world!').
	aPage add: (PDFCellStyle new wh: 40@10; border: true; linefeed: true; text: 'at right').
	aPage add: (PDFCellStyle new wh: 40@10; border: true; linefeed: true; text: 'Second line').
	aPage add: (PDFCellStyle new wh: 40@10; border: true; linefeed: true; text: 'Third line').
	pdfdoc add: aPage.
		
	pdfdoc exportToFile: '/Users/olivier/Desktop/ex1.pdf'.

	
	
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
PDFTest class >> test [
	"generate a sample document"

	"PDFTest ex1"
	
	| pdfdoc aPage myFont |
	pdfdoc := PDFDocument new.
	
	aPage := PDFPage new.
	aPage add: (PDFCellStyle new font: (PDFTimesFont new fontSize: 32);wh: 100@20; border: true; text: 'Hello World!').
	aPage add: (PDFTextStyle new xy: 50@100; text: 'Another text'; font: (PDFCourierFont new)).
	pdfdoc add: aPage.
	
	myFont := PDFCourierFont new fontSize: 32.
	
	Transcript show: (myFont getStringWidth: 'Hello' into: pdfdoc) asString; cr.
	Transcript show: (myFont getIdealFontSizeForTheString: 'Hello' width: 100 into: pdfdoc) asString.

	pdfdoc exportToFile: '/Users/olivier/Desktop/test.pdf'.

	
	
]

{ #category : #'as yet unclassified' }
PDFTest class >> widthTest [
	"generate a sample document for testing the width of fonts"

	"PDFTest widthTest"
	
	| pdfdoc aPage myFont myBigFont width text size |

	pdfdoc := PDFDocument new.	
			
	myFont := PDFTimesFont new fontSize: 16.
	myBigFont := PDFTimesFont new fontSize: 1.
	text := 'Hello World !'.

	"myBigFont fontSize: (myBigFont getIdealFontSizeForTheString: text width: 100 into: pdfdoc).	"

	aPage := PDFPage new.
	"aPage add: (PDFCellStyle new wh: 100@32; border: true; linefeed: true; text: 'Une première ligne')."
	
	width := myFont getStringWidth: text into: pdfdoc.
	
	aPage add: (PDFCellStyle new font: myFont; wh: width@10; border: true; linefeed: true; text: text).

	"aPage add: (PDFCellStyle new font: myBigFont; wh: 100@10; border: true; linefeed: true; text: text)."
	
	"Transcript show: pdfdoc margins asString."
	aPage add: (PDFLineStyle new xy: 10@60; destination: 110@60).
	pdfdoc add: aPage.
	
	pdfdoc exportToFile: '/Users/olivier/Desktop/widthTest.pdf'.

	
	
]
