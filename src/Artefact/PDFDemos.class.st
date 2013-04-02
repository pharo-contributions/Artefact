"
A PDFDemos is the class containing all demos for Artefact framework.

Instance Variables

"
Class {
	#name : #PDFDemos,
	#superclass : #Object,
	#category : #'Artefact-Demos'
}

{ #category : #text }
PDFDemos class >> alignmentsTest [
	"a simple demonstration of Artefact"

	"PDFDemos alignmentsTest"

	| pdfdoc myFont aPage |
	pdfdoc := PDFDocument new.
	myFont := PDFHelveticaFont new fontSize: 16 pt.
	aPage := PDFPage new.
	aPage
		add:
			(PDFFormattedTextElement new
				font: myFont;
				wh: 210 mm @ 10 mm;
				from: 0 mm @ 0 mm;
				text: 'At left').
	aPage
		add:
			(PDFFormattedTextElement new
				font: myFont;
				wh: 210 mm @ 10 mm;
				from: 0 mm @ 20 mm;
				text: 'Center';
				center).
	aPage
		add:
			(PDFFormattedTextElement new
				font: myFont;
				wh: 210 mm @ 10 mm;
				from: 0 mm @ 30 mm;
				text: 'At right';
				right).
	pdfdoc add: aPage.
	pdfdoc exportTo: (FileStream fileNamed: self demoPath , 'alignmentsTest.pdf')
]

{ #category : #composite }
PDFDemos class >> arrowTest [
	"drawing arrows"
	
	"self arrowTest"
	
	| pdfdoc aPage |
	pdfdoc := PDFDocument new.	
	
	aPage := PDFPage new.
	
	aPage add: (PDFArrowElement new
		from: 10 mm @ 10 mm;
		to: 100 mm @30 mm;
		drawColor: (PDFColor new setColor: #(255 0 0))
	).

	aPage add: (PDFArrowElement new
		from: 10 mm @20 mm;
		to: 30 mm @30 mm
	).

	aPage add: (PDFArrowElement new
		from: 120 mm @10 mm;
		to: 120 mm @ 40 mm;
		drawColor: (PDFColor new setColor: #(0 0 255))
	).

	aPage add: (PDFArrowElement new
		from: 125 mm @ 40 mm;
		to: 140 mm @ 40 mm;
		drawColor: (PDFColor new setColor: #(0 0 255))
	).

	aPage add: (PDFArrowElement new
		from: 125 mm @ 40 mm;
		to: 100 mm @ 80 mm;
		drawColor: (PDFColor new setColor: #(0 255 0));
		dotted: (PDFDotted new length: 2mm; space: 3mm)
	).	

	aPage add: (PDFArrowElement new
		from: 40 mm @ 50 mm;
		to: 80 mm @ 90 mm;
		drawColor: (PDFColor new setColor: #(192 255 0));
		thickness:  2 mm
	 ).		
	
	aPage add: (PDFDoubleArrowElement new
		from: 10 mm @ 80 mm;
		to: 100 mm @ 150 mm;
		drawColor: (PDFColor new setColor: #(0 128 0));
		dotted: (PDFDotted new length: 2 mm; space: 2 mm)
	).
			
	pdfdoc add: aPage.
	
	pdfdoc exportTo: (FileStream fileNamed: self demoPath , 'arrowTest.pdf').
]

{ #category : #draw }
PDFDemos class >> bezierTest [
	"drawing bezier curves"
	
	"self bezierTest"
	
	| pdfdoc aPage |
	pdfdoc := PDFDocument new.	
	
	aPage := PDFPage new.

	aPage add: (PDFBezierCurveElement new 
		from: 10mm@50mm;
		to: { 100mm@10mm . 140mm@100mm . 200mm@30mm };
		thickness: 5 mm
	).
	
	pdfdoc add: aPage.
	
	pdfdoc exportTo: (FileStream fileNamed: self demoPath , 'bezierTest.pdf')
]

{ #category : #composite }
PDFDemos class >> cellTest [
	"self cellTest"
	
	"Demonstration of PDFCellElement"
	
	| pdfdoc myFont myTitleFont aPage |
	pdfdoc := PDFDocument new.	

	myTitleFont := PDFTimesFont new fontSize: 24 pt; bold: true.
	
	aPage := PDFPage new.

	aPage add: (PDFCellElement new
		from: 10 mm @ 5 mm;
		wh: 190 mm @ 10 mm;
		fillColor: (PDFColor new setGreyLevel: 224);
		text: 'Demonstration of PDFCellStyle';
		font: myTitleFont;
		center
	).
	
	"horizontal alignment"
	aPage add: (PDFCellElement new  
		from: 10 mm @ 20 mm;
		wh: 50 mm @ 10 mm;
		text: 'alignment: left';
		left
	).
	
	aPage add: (PDFCellElement new  
		from: 80 mm @ 20 mm;
		wh: 50 mm @ 10 mm;
		text: 'alignment: center'
	 ).
	
	aPage add: (PDFCellElement new  
		from: 150 mm @ 20 mm;
		wh: 50 mm @ 10 mm;
		text: 'alignment: right';
		right
	).

	"vertical alignment"
	aPage add: (PDFCellElement new  
		from: 10 mm @ 40 mm;
		wh: 50 mm @ 10 mm;
		text: 'vertical: top';
		left;
		top
	).
	
	aPage add: (PDFCellElement new  
		from: 80 mm @ 40 mm;
		wh: 50 mm @ 10 mm;
		text: 'vertical: middle';
		center;
		middle
	).
	
	aPage add: (PDFCellElement new  
		from: 150 mm @ 40 mm;
		wh: 50 mm @ 10 mm;
		text: 'vertical: bottom';
		right;
		bottom
	).

	"colors"
	aPage add: (PDFCellElement new  
		from: 10 mm @ 60 mm ;
		wh: 50 mm @ 10 mm;
		textColor: (PDFColor new setColor: #(0 0 255));
		drawColor: (PDFColor new setColor: #(255 0 0));
		text: 'text: blue border: red';
		center;
		middle
	).
	
	aPage add: (PDFCellElement new  
		from: 80 mm @ 60 mm;
		wh: 50 mm @ 10 mm;
		textColor: (PDFColor new setColor: #(0 0 255));
		fillColor: (PDFColor new setColor: #(0 255 0));
		text: 'background: green';
		center;
		middle
	).
	
	aPage add: (PDFCellElement new  
		from: 150 mm @ 60 mm;
		wh: 50 mm @ 10 mm;
		textColor: (PDFColor new setGreyLevel: 255);
		fillColor: (PDFColor new setGreyLevel: 128);
		dotted: (PDFDotted new length: 1 mm; space: 1 mm);
		text: 'grey level & dotted border';
		thickness: 0.2 mm;
		center;
		middle
	).
	
	aPage add: (PDFCellElement new  
		from: 10 mm @ 80 mm;
		text: 'A cell without wh'
	).
	self flag: 'TODO Implement layout'.
	"aPage add: (PDFCellElement new  
		wh: 50 mm @ 10 mm;
		text: 'A cell without xy'
	).
	aPage add: (PDFCellElement new  
		wh: 50 mm @ 10 mm;
		text: 'linefeed: true';
		linefeed: true
	).
	aPage add: (PDFCellElement new  
		wh: 50 mm @ 10 mm;
		text: 'linefeed: false';
		linefeed: false
	).
	aPage add: (PDFCellElement new  
		wh: 50 mm @ 10 mm;
		text: 'end'
	)."

	pdfdoc add: aPage.
	
	pdfdoc exportTo: (FileStream fileNamed: self demoPath , 'cellTest.pdf').
]

{ #category : #draw }
PDFDemos class >> circlesTest [
	"drawing circles"
	
	"self circlesTest"
	
	| pdfdoc aPage |
	pdfdoc := PDFDocument new.	
	
	aPage := PDFPage new.

	aPage add: (PDFCircleElement new 
		from: 50 mm @ 50 mm;
		radius: 30 mm
	).

	aPage add: (PDFCircleElement new 
		from: 120 mm @ 50 mm;
		radius: 30 mm;
		fillColor: (PDFColor new setColor: #(0 255 0));
		drawColor: (PDFColor new setColor: #(255 0 0))
	).
	
	pdfdoc add: aPage.
	
	pdfdoc exportTo: (FileStream fileNamed: self demoPath , 'circlesTest.pdf').
]

{ #category : #color }
PDFDemos class >> colorTest [
	"generate a sample document with colors"

	"self colorTest"
	
	| pdfdoc aPage myFont |
	pdfdoc := PDFDocument new.
	
	aPage := PDFPage new.
	aPage add: (PDFCellElement new 
		font: (PDFTimesFont new fontSize: 32pt);
		from: 10mm@10mm;
		wh: 100 mm @ 20 mm; 
		text: 'Hello World!';
		textColor: (PDFColor new setColor: #(255 0 0) );
		fillColor: (PDFColor new setColor: #(0 255 0))
		).
	aPage add: (PDFRectElement new 
		from: 10 mm @ 50 mm;
		wh: 50 mm @ 50 mm; 
		thickness: 5pt;
		drawColor: (PDFColor new setColor: #(0 0 255));
		fillColor: (PDFColor new setColor: #(0 255 0))
		).
		
	pdfdoc add: aPage.
	
	pdfdoc exportTo: (FileStream fileNamed: self demoPath , 'colorTest.pdf').

]

{ #category : #composite }
PDFDemos class >> datatableCustomizedElementTest [
	"generate a customized datatable"

	"self datatableCustomizedElementTest"
	
	| pdfdoc aPage |
		
	pdfdoc := PDFDocument new.
	pdfdoc setFormat: PDFA4Format new.
	pdfdoc metaData title: 'Users report'.
	
	aPage := PDFPage new.
	aPage add: (PDFDataTableCustomizedElement new
		data: {
			{
			"Column captions"
			PDFCellElement new text: 'Name'; fillColor: (PDFColor new setGreyLevel: 230).
			PDFCellElement new text: 'Surname'; fillColor: (PDFColor new setGreyLevel: 230).
			PDFCellElement new text: 'Email'; fillColor: (PDFColor new setGreyLevel: 230).
			}.		
			{
			"first line"
			PDFCellElement new text: 'Smith'.
			PDFCellElement new text: 'Peter'.
			PDFCellElement new text: 'peter.smith@mail.org'.
			}.
			{
			"second line"
			"the email is in a red cell... probably a bad email address :-)"
			PDFCellElement new text: 'Jones'.
			PDFCellElement new text: 'Mickael'.
			PDFCellElement new text: 'mickael.jones@epr.com'; fillColor: (PDFColor new setColor: #(255 0 0)).
			}.
			{
			"third line Unmatched"
			PDFCellElement new text: 'washington'.
			PDFCellElement new text: 'robert'.
			PDFCellElement new text: 'robert.washington@blif.com'.
			}.
		};
		from: 10 mm @ 20 mm;
		wh: 40 mm @ 5  mm
	). 
	
	pdfdoc add: aPage.
	pdfdoc exportTo: (FileStream fileNamed: self demoPath , 'datatableCustomizedStyleTest.pdf').		

	
	
]

{ #category : #composite }
PDFDemos class >> datatableTest [
	"generate a datatable"

	"self datatableTest"
	
	| pdfdoc aPage |
		
	pdfdoc := PDFDocument new.
	pdfdoc setFormat: PDFA4Format new.
	pdfdoc metaData title: 'Users report'.
	
	aPage := PDFPage new.
	aPage add: (PDFDataTableElement new
		data: #(
			#('Smith' 'Peter' 'peter.smith@mail.org')
			#('Jones' 'Mickael' 'mickael.jones@epr.com')
			#('washington' 'robert' 'robert.washington@blif.com')
		);
		from: 10 mm @ 10 mm;
		wh: 60 mm @ 5 mm
	).

	aPage add: (PDFDataTableElement new
		data: #(
			#('Smith' 'Peter' 'peter.smith@mail.org')
			#('Jones' 'Mickael' 'mickael.jones@epr.com')
			#('washington' 'robert' 'robert.washington@blif.com')
		);
		textColor:(PDFColor new setColor: #(0 0 255));
		fillColor: (PDFColor new setGreyLevel: 230);
		font: (PDFTimesFont new fontSize: 6 pt);
		dotted: (PDFDotted new length: 0.2mm; space: 0.2mm);
		from: 10 mm @ 30 mm;
		wh: 30 mm @ 5 mm
	).
	
	pdfdoc add: aPage.
		
	pdfdoc exportTo: (FileStream fileNamed: self demoPath , 'datatableTest.pdf').

	
	
]

{ #category : #composite }
PDFDemos class >> datatableWithCaptionsTest [
	"generate a datatable with captions"

	"self datatableWithCaptionsTest"
	
	| pdfdoc aPage |
		
	pdfdoc := PDFDocument new.
	pdfdoc styleSheet setAttribute: #captionColor value: (PDFColor new setColor: { 158 . 158 .79 }).
	pdfdoc setFormat: PDFA4Format new.
	pdfdoc metaData title: 'Users report'.
	
	aPage := PDFPage new.
	
	aPage add: (PDFDataTableWithColumnsCaptionElement new
		captions: #( 'Name' 'Surname' 'email');
		data: #(
			#('Smith' 'Peter' 'peter.smith@mail.org')
			#('Jones' 'Mickael' 'mickael.jones@epr.com')
			#('washington' 'robert' 'robert.washington@blif.com')
		);
		from: 10 mm @ 20 mm;
		wh: 40 mm @ 5 mm;
		captionColor: (PDFColor new setGreyLevel: 192)
	).	

	aPage add: (PDFDataTableWithRowsCaptionElement new
		captions: #( 'Name' 'Surname' 'email');
		data: #(
			#('Smith' 'Jones' 'washington')
			#('Peter' 'Mickael' 'robert')
			#('peter.smith@mail.org' 'mickael.jones@epr.com' 'robert.washington@blif.com')
		);
		from: 10 mm @ 50 mm;
		wh: 40 mm @ 5 mm
	).
	
	pdfdoc add: aPage.
		
	pdfdoc exportTo: (FileStream fileNamed: self demoPath , 'datatableWithCaptions.pdf').

	
	
]

{ #category : #'as yet unclassified' }
PDFDemos class >> demo [
	"a simple demonstration of Artefact"
	
	"PDFDemos demo"
	
	| pdfdoc myFont myBigFont aPage |
	pdfdoc := PDFDocument new.	

	myBigFont := PDFCourierFont new fontSize: 36 pt; bold: true.
	myFont := PDFHelveticaFont new fontSize: 16 pt.
	
	aPage := PDFPage new.

	aPage add: (PDFCellElement new 
		font: myBigFont; 
		from: 10mm@ 10mm;
		wh: 100 mm @ 60 mm; 
		textColor: (PDFColor new setColor: #(0 255 0));
		text: 'Première ligne').
		
	aPage add: (PDFCellElement new 
		font: myBigFont;
		from: 10mm@ 80mm;
		wh: 100 mm @ 24 mm; 
		textColor: (PDFColor new setColor: #(128 128 0)); 
		text: 'Artefact').
	
	aPage add: (PDFCellElement new 
		font: myFont; 
		from: 10mm@ 110mm;
		wh: 100 mm @ 10 mm; 
		textColor: (PDFColor new setColor: #(0 0 0));
		text: 'PDF Framework for Pharo').
			
	aPage add: (PDFLineElement new from: 10 mm @ 10 mm; to: 20 mm @ 10 mm; drawColor: (PDFColor new setColor: #(255 0 0))).
	aPage add: (PDFLineElement new from: 10 mm @ 10 mm; to: 10 mm @ 20 mm; drawColor:(PDFColor new setColor: #(255 0 0))).

	
	pdfdoc add: aPage.
	
	pdfdoc exportTo: (StandardFileStream fileNamed: self demoPath , 'demo.pdf').
]

{ #category : #accessing }
PDFDemos class >> demoPath [
	^'/Users/olivier/Desktop/Projet Artefact/'
]

{ #category : #document }
PDFDemos class >> displayLayoutTest [
	"generate documents with zooms"

	"self displayLayoutTest"

	"PDFDocument new continuousPages;
		add: (PDFPage new add: (PDFTextElement new from: 5 mm @ 5 mm; text: 'continuousPages Page 1'));
		add: (PDFPage new add: (PDFTextElement new from: 5 mm @ 5 mm; text: 'continuousPages Page 2'));
		exportTo: (FileStream fileNamed: self demoPath , 'continuousPagesTest.pdf').

	PDFDocument new singlePage; 
		add: (PDFPage new add: (PDFTextElement new from: 5 mm @ 5 mm; text: 'singlePage Page 1'));
		add: (PDFPage new add: (PDFTextElement new from: 5 mm @ 5 mm; text: 'singlePage Page 2'));
		exportTo: (FileStream fileNamed: self demoPath , 'singlePage.pdf').
	
	PDFDocument new twoPages; 
		add: (PDFPage new add: (PDFTextElement new from: 5 mm @ 5 mm; text: 'twoPages Page 1'));
		add: (PDFPage new add: (PDFTextElement new from: 5 mm @ 5 mm; text: 'twoPages Page 2'));
		exportTo: (FileStream fileNamed: self demoPath , 'twoPages.pdf')."

	
	
]

{ #category : #document }
PDFDemos class >> displayModeTest [
	"generate documents with zooms"

	"self displayModeTest"

	| doc |
	
"	doc := PDFDocument new fullPage.
	doc add: (PDFPage new add: (PDFTextElement new from: 5 mm @ 5 mm; text: 'Fullpage document')).
	doc exportTo: (FileStream fileNamed: self demoPath , 'fullPageTest.pdf').

	doc := PDFDocument new zoom: 300; 
		add: (PDFPage new add: (PDFTextElement new from: 5 mm @ 5 mm; text: 'zoom'));
		exportTo: (FileStream fileNamed: self demoPath , 'zoomPageTest.pdf').
	
	doc := PDFDocument new fullWidth; 
		add: (PDFPage new add: (PDFTextElement new from: 5 mm @ 5 mm; text: 'full width'));
		exportTo: (FileStream fileNamed: self demoPath , 'fullWidthTest.pdf').

	
	"
]

{ #category : #draw }
PDFDemos class >> dottedTest [
	"drawing with dotted"
	
	"self dottedTest"
	
	| pdfdoc aPage |
	pdfdoc := PDFDocument new.	
	
	aPage := PDFPage new.
	
	aPage add: (PDFLineElement new from: 0 mm @ 0 mm; to: 30 mm@ 0 mm).
	aPage add: (PDFLineElement new from: 0 mm @ 0 mm; to: 0 mm @ 30 mm).
	aPage add: (PDFLineElement new from: 0 mm @ 5 mm; to: 150 mm @ 5 mm).
	
	aPage add: (PDFLineElement new
		from: 10 mm @ 10 mm;
		to: 100 mm @ 30 mm;
		dotted: (PDFDotted new length: 2 mm; space: 3 mm)
	).
	
	aPage add: (PDFLineElement new
		from: 30 mm @ 30 mm;
		to: 80 mm @ 50 mm;
		dotted: (PDFDotted new)
	).

	aPage add: (PDFLineElement new
		from: 10 mm @ 10 mm ;
		to: 10 mm @ 50 mm
	 ).
	
	aPage add: (PDFRectElement new
		from: 80 mm @ 80 mm;
		wh: 100 mm @ 30 mm; 
		dotted: (PDFDotted new length: 5 mm; space: 3 mm);
		thickness:  2 mm
		).
			
	pdfdoc add: aPage.
	
	pdfdoc exportTo: (FileStream fileNamed: self demoPath , 'dottedTest.pdf')
]

{ #category : #color }
PDFDemos class >> drawStyleSheetTest [
	"generate a sample document with colors"

	"self drawStyleSheetTest"
	
	| pdfdoc aPage myFont |
	pdfdoc := PDFDocument new.
	
	aPage := PDFPage new.

	aPage add: (PDFRectElement new 
		from: 10 mm @ 50 mm;
		wh: 50 mm @ 50 mm; 
		thickness: 5 mm;
		drawColor: (PDFColor new setColor: #(0 0 255));
		fillColor: (PDFColor new setColor: #(0 255 0))
		).
		
	aPage add: (PDFRectElement new 
		from: 50 mm @ 60 mm;
		wh: 50 mm @ 50 mm).
		
	pdfdoc add: aPage.
	
	pdfdoc exportTo: (FileStream fileNamed: self demoPath , 'drawStyleSheetTest.pdf').

]

{ #category : #text }
PDFDemos class >> euroTest [
	"a PDF document with the euro sign"

	"PDFDemos euroTest"
	| pdfdoc aPage theText|

       pdfdoc := PDFDocument new.

       aPage := PDFPage new.
	theText :=  ('Price: (24{1})toto' format: { (128 asCharacter) asString} ).
	
       aPage add: (PDFTextElement new from: 50 mm @ 10 mm; text: theText; font: (PDFTimesFont new)).
       aPage add: (PDFTextElement new from: 50 mm @ 20 mm; text: theText; font: (PDFCourierFont new)).
       aPage add: (PDFTextElement new from: 50 mm @ 30 mm; text: theText; font: (PDFHelveticaFont  new)).

	pdfdoc add: aPage.
	
      pdfdoc exportTo: (StandardFileStream fileNamed: self demoPath , 'euroTest.pdf')
]

{ #category : #color }
PDFDemos class >> greyLevelTest [
	"generate a sample document with grey levels"

	"self greyLevelTest"
	
	| pdfdoc aPage myFont |
	pdfdoc := PDFDocument new.
	
	aPage := PDFPage new.

	aPage add: (PDFTextElement new 
		from: 10 mm @ 10 mm; 
		text: 'A grey level text'; 
		font: (PDFCourierFont new);
		textColor: (PDFColor new setGreyLevel: 128)
		).
		
	aPage add: (PDFRectElement new 
		from: 10 mm @ 20 mm;
		wh: 50 mm @ 50 mm; 
		thickness: 5 pt;
		drawColor: (PDFColor new setGreyLevel: 196);
		fillColor: (PDFColor new setGreyLevel: 164)
		).
		
	pdfdoc add: aPage.
	
	pdfdoc exportTo: (FileStream fileNamed: self demoPath , 'greyLevelTest.pdf').

]

{ #category : #experimental }
PDFDemos class >> headerFooterTest [
	"generate a sample document with a header and a footer"

	"self headerFooterTest"
	
	| pdfdoc aPage secondPage myFont |

	myFont := PDFCourierFont new fontSize: 32 pt.

	pdfdoc := PDFDocument new.
	
	aPage := PDFPage new.
	aPage add: (PDFCellElement new 
		from: 10mm @ 10 mm;
		font: myFont;
		text: 'Header and Footer test').

	pdfdoc add: aPage.

	secondPage := PDFPage new.
	secondPage add: (PDFCellElement new 
		from: 10mm @ 10 mm;
		font: myFont;
		text: 'Header and Footer test').	
			
	"secondPage header: false; footer: false."
	pdfdoc add: secondPage.		
			
	pdfdoc exportTo: (FileStream fileNamed: self demoPath , 'headerFooterTest.pdf').

	
	
]

{ #category : #layout }
PDFDemos class >> horizontalLayoutTest [
	"self horizontalLayoutTest"

	"Demonstration of PDFCellElement"

	| pdfdoc myTitleFont aPage |
	pdfdoc := PDFDocument new.
	myTitleFont := PDFTimesFont new
		fontSize: 24 pt;
		bold: true.
	aPage := PDFPage new format: PDFA0Format new setLandscape ;
		add:
			(PDFHorizontalLayout new from: 10mm@10mm;
				add:
						(PDFCellElement new
								from: 10 mm @ 5 mm;
								wh: 190 mm @ 10 mm;
								fillColor: (PDFColor new setGreyLevel: 224);
								text: 'Demonstration of PDFCellStyle';
								font: myTitleFont;
								center);
				add:
						(PDFCellElement new
								from: 10 mm @ 20 mm;
								wh: 50 mm @ 10 mm;
								text: 'alignment: left';
								left);
				add:
						(PDFCellElement new
								from: 80 mm @ 20 mm;
								wh: 50 mm @ 10 mm;
								text: 'alignment: center');
				add:
						(PDFCellElement new
								from: 150 mm @ 20 mm;
								wh: 50 mm @ 10 mm;
								text: 'alignment: right';
								right);
				add:
						(PDFCellElement new
								from: 10 mm @ 40 mm;
								wh: 50 mm @ 10 mm;
								text: 'vertical: top';
								left;
								top);
				add:
						(PDFCellElement new
								from: 80 mm @ 40 mm;
								wh: 50 mm @ 10 mm;
								text: 'vertical: middle';
								center;
								middle);
				add:
						(PDFCellElement new
								from: 150 mm @ 40 mm;
								wh: 50 mm @ 10 mm;
								text: 'vertical: bottom';
								right;
								bottom);
				add:
						(PDFCellElement new
								from: 10 mm @ 60 mm;
								wh: 50 mm @ 10 mm;
								textColor: (PDFColor new setColor: #(0 0 255));
								drawColor: (PDFColor new setColor: #(255 0 0));
								text: 'text: blue border: red';
								center;
								middle);
				add:
						(PDFCellElement new
								from: 80 mm @ 60 mm;
								wh: 50 mm @ 10 mm;
								textColor: (PDFColor new setColor: #(0 0 255));
								fillColor: (PDFColor new setColor: #(0 255 0));
								text: 'background: green';
								center;
								middle);
				add:
						(PDFCellElement new
								from: 150 mm @ 60 mm;
								wh: 50 mm @ 10 mm;
								textColor: (PDFColor new setGreyLevel: 255);
								fillColor: (PDFColor new setGreyLevel: 128);
								dotted:
										(PDFDotted new
												length: 1 mm;
												space: 1 mm);
								text: 'grey level & dotted border';
								thickness: 0.2 mm;
								center;
								middle);
				add:
						(PDFCellElement new
								from: 10 mm @ 80 mm;
								text: 'A cell without wh');
				add:
						(PDFCellElement new
								wh: 50 mm @ 10 mm;
								text: 'A cell without xy')).
	pdfdoc add: aPage.
	pdfdoc exportTo: (FileStream fileNamed: self demoPath , 'horizontalLayoutTest.pdf')
]

{ #category : #experimental }
PDFDemos class >> imageJPG [
	"Artefact use an JPG file"

	"self imageJPG"

	| pdfdoc aPage |
	pdfdoc := PDFDocument new.
	aPage := PDFPage new.
	aPage
		add:
			((PDFJpegElement
				fromStream: (StandardFileStream fileNamed: 'Pharo.jpg'))
				from: 5 mm @ 0 mm;
				wh: 160 mm  @ 90 mm).
	pdfdoc add: aPage.
	pdfdoc exportTo: (FileStream fileNamed: self demoPath , 'imageJPG.pdf')
]

{ #category : #document }
PDFDemos class >> infosTest [
	"generate a sample document with informations"

	"self infosTest"
	
	| pdfdoc aPage aSecondPage |
	pdfdoc := PDFDocument new.
	
	pdfdoc metaData title: 'Le titre du document'; 
		subject: 'test de la zone d''information'; 
		author: 'Olivier Auverlot'; 
		keywords: 'test zone infos';
		creator: 'Artefact - Pharo'.
	
	aPage := PDFPage new.
	
	pdfdoc add: aPage.
	pdfdoc exportTo: (FileStream fileNamed: self demoPath , 'infoTest.pdf')

	
	
]

{ #category : #draw }
PDFDemos class >> lineTest [
	"drawing with simple lines around the page"

	"self lineTest"

	| pdfdoc aPage |
	pdfdoc := PDFDocument new.
	aPage := PDFPage new.
	aPage
		add:
			(PDFLineElement new
				from: 0 mm @ 0 mm;
				to: 210 mm @ 0 mm).
	aPage
		add:
			(PDFLineElement new
				from: 0 mm @ 0 mm;
				to: 0 mm @ 297 mm).
	aPage
		add:
			(PDFLineElement new
				from: 0 mm @ 297 mm;
				to: 210 mm @ 297 mm).
	aPage
		add:
			(PDFLineElement new
				from: 0 mm @ 0 mm;
				to: 210 mm @ 297 mm).
	aPage
		add:
			(PDFLineElement new
				from: 210 mm @ 297 mm;
				to: 210 mm @ 0 mm).
	aPage
		add:
			(PDFLineElement new
				from: 210 mm @ 0 mm;
				to: 0 mm @ 297 mm).
	pdfdoc add: aPage.
	pdfdoc styleSheet drawColor: (PDFColor new setColor: #(200 25 25)).
	pdfdoc exportTo: (FileStream fileNamed: self demoPath , 'lineTest.pdf')
]

{ #category : #document }
PDFDemos class >> multiOrientationsTest [
	"Create a document with two pages and two different orientations"
	
	"self multiOrientationsTest"
	
	| pdfdoc myBigFont firstPage secondPage myLandscapeFormat |
	pdfdoc := PDFDocument new.	

	myLandscapeFormat := PDFA3Format new setLandscape.
	
	myBigFont := PDFTimesFont new fontSize: 16 pt.
	
	firstPage := PDFPage new.	
	firstPage add: (PDFCellElement new 
		from: 10mm@10mm;
		font: myBigFont; 
		wh: 40 mm @ 10 mm; 
		text: 'Page 1').
	
	secondPage := PDFPage new format: myLandscapeFormat.
	
	secondPage add: (PDFCellElement new 
		from: 10mm@10mm;
		font: myBigFont; 
		wh: 40 mm @ 10 mm; 
		text: 'Page en A3').	
			
	pdfdoc add: firstPage.
	pdfdoc add: secondPage.

	pdfdoc exportTo: (FileStream fileNamed: self demoPath , 'multiOrientationsTest.pdf')
]

{ #category : #cool }
PDFDemos class >> oneLineTest [
	PDFDocument new add: (PDFPage new add: (PDFTextElement new text: 'Hello'; from: 10mm@10mm)); exportTo: (FileStream fileNamed: 'oneLine.pdf')
]

{ #category : #composite }
PDFDemos class >> paragraphTest [
	"Use of paragraphs"
	
	"self paragraphTest"
	
	| pdfdoc aPage |
	pdfdoc := PDFDocument new.	
	
	aPage := PDFPage new.

	aPage add: (PDFParagraphElement new 
		from: 90 mm @ 40 mm;
		wh: 100 mm @ 20 mm; 
		text: '1 Emensis itaque difficultatibus multis et nive obrutis callibus plurimis ubi prope Rauracum ventum est ad supercilia fluminis Rheni, resistente multitudine Alamanna pontem suspendere navium conpage Romani vi nimia vetabantur ritu grandinis undique convolantibus telis, et cum id inpossibile videretur, imperator cogitationibus magnis attonitus, quid capesseret ambigebat.').

	aPage add: (PDFParagraphElement new 
		from: 20 mm @ 40 mm;
		wh: 60 mm @ 60 mm; 
		text: '2 Quam ob rem ut ii qui superiores sunt submittere se debent in amicitia, sic quodam modo inferiores extollere. Sunt enim quidam qui molestas amicitias faciunt, cum ipsi se contemni putant; quod non fere contingit nisi iis qui etiam contemnendos se arbitrantur; qui hac opinione non modo verbis sed etiam opere levandi sunt.').

	aPage add: (PDFParagraphElement new 
		from: 100 mm @ 80 mm;
		wh: 60 mm @ 70 mm; 
		text: '3 Denique Antiochensis ordinis vertices sub uno elogio iussit occidi ideo efferatus, quod ei celebrari vilitatem intempestivam urgenti, cum inpenderet inopia, gravius rationabili responderunt; et perissent ad unum ni comes orientis tunc Honoratus fixa constantia restitisset.';
		center).
		
	aPage add: (PDFParagraphElement new 
		from: 10 mm @ 120 mm;
		wh: 60 mm @ 80 mm; 
		text: '4 Igitur per multiplices dilatata fortunas cum ambigerentur quaedam, non nulla levius actitata constaret, post multorum clades Apollinares ambo pater et filius in exilium acti cum ad locum Crateras nomine pervenissent, villam scilicet suam quae ab Antiochia vicensimo et quarto disiungitur lapide, ut mandatum est, fractis cruribus occiduntur.';
		right
		).
		
	pdfdoc add: aPage.
	
	pdfdoc exportTo: (FileStream fileNamed: self demoPath , 'paragraphTest.pdf').
]

{ #category : #draw }
PDFDemos class >> polygonsTest [
	"drawing polygons"
	
	"self polygonsTest"
	
	| pdfdoc aPage |
	pdfdoc := PDFDocument new.	
	
	aPage := PDFPage new.

	aPage add: (PDFPolygonElement new 
		from: 10 mm @ 10 mm ; 
		to: { 60  mm @ 20 mm . 50 mm @ 40 mm . 30 mm @ 50 mm . 15 mm@ 45 mm };
		drawColor: (PDFColor new setColor: #(0 0 255))
	).
	
	aPage add: (PDFFilledPolygonElement new 
		from: 10 mm @ 55 mm; 
		to: { 60 mm @  60 mm  . 50 mm @ 100  mm . 30 mm @ 110 mm . 15 mm @ 105  mm };
		drawColor: (PDFColor new setColor: #(0 0 255));
		fillColor: (PDFColor new setColor: #(255 0 0));
		thickness: 5 mm	
	).
	pdfdoc add: aPage.
	

	pdfdoc exportTo: (FileStream fileNamed: self demoPath , 'polygonsTest.pdf')
]

{ #category : #draw }
PDFDemos class >> rectsTest [
	"intersecting rects"
	
	"self rectsTest"
	
	| pdfdoc aPage |
	pdfdoc := PDFDocument new.	
	
	aPage := PDFPage new.
	
	aPage add: (PDFRectElement new
		from: 0 mm @ 0 mm;
		wh: 210 mm @ 297 mm
	).
	aPage add: (PDFRectElement new
		from: 10 mm @ 10 mm;
		wh: 100 mm @ 30 mm).
	aPage add: (PDFRectElement new
		from: 15 mm @ 15 mm;
		wh: 100 mm @ 30 mm;
		fillColor: (PDFColor new setColor: #(142 24 78))
		).		
	aPage add: (PDFRectElement new
		from: 20 mm @ 20 mm;
		wh: 100 mm @ 30 mm;
		drawColor: (PDFColor new setColor: #(0 255 0)) 
		).
	pdfdoc add: aPage.

	pdfdoc exportTo: (FileStream fileNamed: self demoPath , 'rectsTest.pdf')
]

{ #category : #text }
PDFDemos class >> textTest [
	"PDFDemos textTest"

	| pdfdoc myFont myBigFont aPage myFontInMilliMeters |
	pdfdoc := PDFDocument new.
	myFont := PDFTimesFont new fontSize: 24 pt.
	myFontInMilliMeters := PDFTimesFont new fontSize: 5 mm.
	aPage := PDFPage new.
	aPage
		add:
				(PDFTextElement new
						from: 10 mm @ 10 mm;
						text: 'A very simple text');
		add:
				(PDFTextElement new
						font: myFont;
						from: 10 mm @ 30 mm;
						text: 'A very simple text with specified font');
		add:
				(PDFTextElement new
						textColor: (PDFColor new setColor: #(255 0 0));
						from: 10 mm @ 50 mm;
						text: 'A very simple text with specified color');
		add:
				(PDFTextElement new
						textColor: (PDFColor new setColor: #(0 0 255));
						font: myFont;
						from: 10 mm @ 70 mm;
						text: 'A very simple text with specified color and font');
		add:
				(PDFTextElement new
						textColor: (PDFColor new setColor: #(0 128 255));
						font: myFontInMilliMeters;
						from: 10 mm @ 90 mm;
						text: 'A text with font expressed in mm (5)');
		add:
				(PDFLineElement new
						from: 10 mm @ 90 mm;
						to: 160 mm @ 90 mm);
		add:
				(PDFLineElement new
						from: 10 mm @ 85 mm;
						to: 160 mm @ 85 mm).
	pdfdoc add: aPage.
	pdfdoc exportTo: (FileStream fileNamed: self demoPath , 'textTest.pdf')
]

{ #category : #draw }
PDFDemos class >> thicknessTest [
	"generate a sample document for testing the draw objects"

	"self thicknessTest"
	
	| pdfdoc aPage width xy1 xy2 |

	pdfdoc := PDFDocument new.	
	aPage := PDFPage new.
	width := 1 mm.
	xy1 := 10 mm @ 20 mm.
	xy2 := 100 mm@ 20 mm.
	
	1 to: 5 do: [ :i |
		aPage add: (PDFLineElement new from: xy1; to: xy2; thickness: i mm).
		xy1 := (xy1 x) @ (xy1 y + 10 mm).
		xy2 := (xy2 x) @ (xy2 y + 10 mm).
	].	
	
	aPage add: (PDFRectElement new 
		from: 50 mm @ 80 mm;
		wh: 50 mm @ 50 mm; 
		thickness:  5 mm
		).
	
	pdfdoc add: aPage.
	
	pdfdoc exportTo: (FileStream fileNamed: self demoPath , 'thicknesTest.pdf')

	
	
]

{ #category : #draw }
PDFDemos class >> twoColoredRectsTest [
	"intersecting rects"
	
	"self twoColoredRectsTest"
	
	| pdfdoc aPage |
	pdfdoc := PDFDocument new.	
	
	aPage := PDFPage new.
	
	aPage add: (PDFRectElement new
		from: 10 mm @ 10 mm;
		wh: 100 mm @ 30 mm;
		fillColor: (PDFColor new setColor: #(142 24 78));
		drawColor: (PDFColor new setColor: #(255 0 0))).
	aPage add: (PDFRectElement new
		from: 15 mm @ 15 mm;
		wh: 100 mm @30 mm;
		fillColor: (PDFColor new setColor: #(24 57 205));
		drawColor: (PDFColor new setColor: #(0 255 0))).		
	pdfdoc add: aPage.
	
	pdfdoc exportTo: (FileStream fileNamed: self demoPath , 'twoColoredRectsTest.pdf')
]

{ #category : #layout }
PDFDemos class >> verticalLayoutTest [
	"self verticalLayoutTest"

	"Demonstration of PDFCellElement"

	| pdfdoc myTitleFont aPage |
	pdfdoc := PDFDocument new.
	myTitleFont := PDFTimesFont new
		fontSize: 24 pt;
		bold: true.
	aPage := PDFPage new
		add:
			(PDFVerticalLayout new from: 10mm@10mm;
				add:
						(PDFCellElement new
								from: 10 mm @ 5 mm;
								wh: 190 mm @ 10 mm;
								fillColor: (PDFColor new setGreyLevel: 224);
								text: 'Demonstration of PDFCellStyle';
								font: myTitleFont;
								center);
				add:
						(PDFCellElement new
								from: 10 mm @ 20 mm;
								wh: 50 mm @ 10 mm;
								text: 'alignment: left';
								left);
				add:
						(PDFCellElement new
								from: 80 mm @ 20 mm;
								wh: 50 mm @ 10 mm;
								text: 'alignment: center');
				add:
						(PDFCellElement new
								from: 150 mm @ 20 mm;
								wh: 50 mm @ 10 mm;
								text: 'alignment: right';
								right);
				add:
						(PDFCellElement new
								from: 10 mm @ 40 mm;
								wh: 50 mm @ 10 mm;
								text: 'vertical: top';
								left;
								top);
				add:
						(PDFCellElement new
								from: 80 mm @ 40 mm;
								wh: 50 mm @ 10 mm;
								text: 'vertical: middle';
								center;
								middle);
				add:
						(PDFCellElement new
								from: 150 mm @ 40 mm;
								wh: 50 mm @ 10 mm;
								text: 'vertical: bottom';
								right;
								bottom);
				add:
						(PDFCellElement new
								from: 10 mm @ 60 mm;
								wh: 50 mm @ 10 mm;
								textColor: (PDFColor new setColor: #(0 0 255));
								drawColor: (PDFColor new setColor: #(255 0 0));
								text: 'text: blue border: red';
								center;
								middle);
				add:
						(PDFCellElement new
								from: 80 mm @ 60 mm;
								wh: 50 mm @ 10 mm;
								textColor: (PDFColor new setColor: #(0 0 255));
								fillColor: (PDFColor new setColor: #(0 255 0));
								text: 'background: green';
								center;
								middle);
				add:
						(PDFCellElement new
								from: 150 mm @ 60 mm;
								wh: 50 mm @ 10 mm;
								textColor: (PDFColor new setGreyLevel: 255);
								fillColor: (PDFColor new setGreyLevel: 128);
								dotted:
										(PDFDotted new
												length: 1 mm;
												space: 1 mm);
								text: 'grey level & dotted border';
								thickness: 0.2 mm;
								center;
								middle);
				add:
						(PDFCellElement new
								from: 10 mm @ 80 mm;
								text: 'A cell without wh');
				add:
						(PDFCellElement new
								wh: 50 mm @ 10 mm;
								text: 'A cell without xy')).
	pdfdoc add: aPage.
	pdfdoc exportTo: (FileStream fileNamed: self demoPath , 'verticalLayoutTest.pdf')
]

{ #category : #'as yet unclassified' }
PDFDemos class >> widthTest [
	"generate a sample document for testing the width of fonts"

	"PDFDemos widthTest"
	
	| pdfdoc aPage myFont myBigFont width text size |

	pdfdoc := PDFDocument new.	
			
	myFont := PDFTimesFont new fontSize: 16 pt.
	myBigFont := PDFTimesFont new fontSize: 1 pt.
	text := 'Hello World !'.

	"myBigFont fontSize: (myBigFont getIdealFontSizeForTheString: text width: 100 into: pdfdoc).	"

	aPage := PDFPage new.
	"aPage add: (PDFCellStyle new wh: 100@32; border: true; linefeed: true; text: 'Une première ligne')."
	
	width := myFont getStringWidth: text.
	
	aPage add: (PDFCellElement new from: 5mm@10mm; font: myFont; wh: width@10mm; text: text).

	"aPage add: (PDFCellStyle new font: myBigFont; wh: 100@10; border: true; linefeed: true; text: text)."
	
	"Transcript show: pdfdoc margins asString."
	aPage add: (PDFLineElement new from: 10 mm @ 60 mm; to: 110 mm @ 60 mm).
	pdfdoc add: aPage.
	
	pdfdoc exportTo: (FileStream fileNamed: self demoPath , 'widthTest.pdf').

	
	
]
