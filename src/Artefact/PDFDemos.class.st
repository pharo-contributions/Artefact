"
A PDFDemos is the class containing all demos for Artefact framework. By default each generation result is written in the default pharo directory but you can define your own in the demoPath method 

example: 

demoPath
	^ '/Users/pharo/pdf/'

Instance Variables

"
Class {
	#name : #PDFDemos,
	#superclass : #Object,
	#category : #'Artefact-Demos'
}

{ #category : #templates }
PDFDemos class >> CDTemplateTest [
	"PDFDemos CDTemplateTest"
	self new CDTemplateTest: (self streamNamed: 'CDTemplateTest.pdf')
]

{ #category : #templates }
PDFDemos class >> DVDTemplateTest [
	"PDFDemos DVDTemplateTest"
	self new DVDTemplateTest: (self streamNamed: 'DVDTemplateTest.pdf')
]

{ #category : #text }
PDFDemos class >> alignmentsTest [
	"PDFDemos alignmentsTest"
	self new alignmentsTest: (self streamNamed: 'alignmentsTest.pdf')
]

{ #category : #composite }
PDFDemos class >> arrowTest [
	"PDFDemos arrowTest"
	self new arrowTest: (self streamNamed: 'arrowTest.pdf')
]

{ #category : #draw }
PDFDemos class >> bezierTest [
	"PDFDemos bezierTest"
	self new bezierTest: (self streamNamed: 'bezierTest.pdf')
]

{ #category : #experimental }
PDFDemos class >> brochure [
	"PDFDemos brochure"
	self new brochure: (self streamNamed: 'brochure.pdf')
]

{ #category : #draw }
PDFDemos class >> capLineTest [
	"PDFDemos capLineTest"
	self new capLineTest: (self streamNamed: 'capLineTest.pdf')
]

{ #category : #composite }
PDFDemos class >> cellTest [
	"PDFDemos cellTest"
	self new cellTest: (self streamNamed: 'cellTest.pdf')
]

{ #category : #draw }
PDFDemos class >> circlesTest [
	"PDFDemos circlesTest"
	self new circlesTest: (self streamNamed: 'circlesTest.pdf')
]

{ #category : #color }
PDFDemos class >> colorTest [
	"PDFDemos colorTest"
	self new colorTest: (self streamNamed: 'colorTest.pdf')
]

{ #category : #composite }
PDFDemos class >> datatableCustomizedElementTest [
	"PDFDemos datatableCustomizedElementTest"
	self new datatableCustomizedElementTest: (self streamNamed: 'datatableCustomizedElementTest.pdf')
]

{ #category : #composite }
PDFDemos class >> datatableTest [
	"PDFDemos datatableTest"
	self new datatableTest: (self streamNamed: 'datatableTest.pdf')
]

{ #category : #composite }
PDFDemos class >> datatableWithCaptionsTest [
	"PDFDemos datatableWithCaptionsTest"
	self new datatableWithCaptionsTest: (self streamNamed: 'datatableWithCaptionsTest.pdf')
]

{ #category : #tool }
PDFDemos class >> demoPath [
	^ '/Users/larcheveque/pdf/'
]

{ #category : #document }
PDFDemos class >> displayModeTest [
	"PDFDemos displayModeTest"
	self new displayModeTest: (self streamNamed: 'displayModeTest.pdf')
]

{ #category : #'display setup' }
PDFDemos class >> documentDisplayLayoutTest [
	"PDFDemos documentDisplayLayoutTest"
	self new documentDisplayLayoutTest: (self streamNamed: 'documentDisplayLayoutTest.pdf')
]

{ #category : #'display setup' }
PDFDemos class >> documentDisplayModeTest [
	"PDFDemos documentDisplayModeTest"
	self new documentDisplayModeTest: (self streamNamed: 'documentDisplayModeTest.pdf')
]

{ #category : #'display setup' }
PDFDemos class >> documentZoomTest [
	"PDFDemos documentZoomTest"
	self new documentZoomTest: (self streamNamed: 'documentZoomTest.pdf')
]

{ #category : #draw }
PDFDemos class >> dottedTest [
	"PDFDemos dottedTest"
	self new dottedTest: (self streamNamed: 'dottedTest.pdf')
]

{ #category : #color }
PDFDemos class >> drawStyleSheetTest [
	"PDFDemos drawStyleSheetTest"
	self new drawStyleSheetTest: (self streamNamed: 'drawStyleSheetTest.pdf')
]

{ #category : #text }
PDFDemos class >> euroTest [
	"PDFDemos euroTest"
	self new euroTest: (self streamNamed: 'euroTest.pdf')
]

{ #category : #color }
PDFDemos class >> greyLevelTest [
	"PDFDemos greyLevelTest"
	self new greyLevelTest: (self streamNamed: 'greyLevelTest.pdf')
]

{ #category : #layout }
PDFDemos class >> horizontalLayoutTest [
	"PDFDemos horizontalLayoutTest"
	self new horizontalLayoutTest: (self streamNamed: 'horizontalLayoutTest.pdf')
]

{ #category : #image }
PDFDemos class >> imageJPG [
	"PDFDemos imageJPG"
	self new imageJPG: (self streamNamed: 'imageJPG.pdf')
]

{ #category : #document }
PDFDemos class >> infosTest [
	"PDFDemos infosTest"
	self new infosTest: (self streamNamed: 'infosTest.pdf')
]

{ #category : #draw }
PDFDemos class >> lineTest [
	"PDFDemos lineTest"
	self new lineTest: (self streamNamed: 'lineTest.pdf')
]

{ #category : #document }
PDFDemos class >> multiOrientationsTest [
	"PDFDemos multiOrientationsTest"
	self new multiOrientationsTest: (self streamNamed: 'multiOrientationsTest.pdf')
]

{ #category : #style }
PDFDemos class >> multiStyleArrowsTest [
	"PDFDemos multiStyleArrowsTest"
	self new multiStyleArrowsTest: (self streamNamed: 'multiStyleArrowsTest.pdf')
]

{ #category : #cool }
PDFDemos class >> oneLineTest [
	"PDFDemos oneLineTest"
	self new oneLineTest: (self streamNamed: 'oneLineTest.pdf')
]

{ #category : #composite }
PDFDemos class >> paragraphTest [
	"PDFDemos paragraphTest"
	self new paragraphTest: (self streamNamed: 'paragraphTest.pdf')
]

{ #category : #composite }
PDFDemos class >> paragraphWithSpacingTest [
	"PDFDemos paragraphWithSpacingTest"
	self new paragraphWithSpacingTest: (self streamNamed: 'paragraphWithSpacingTest.pdf')
]

{ #category : #draw }
PDFDemos class >> polygonsTest [
	"PDFDemos polygonsTest"
	self new polygonsTest: (self streamNamed: 'polygonsTest.pdf')
]

{ #category : #draw }
PDFDemos class >> rectsTest [
	"PDFDemos rectsTest"
	self new rectsTest: (self streamNamed: 'rectsTest.pdf')
]

{ #category : #tool }
PDFDemos class >> streamNamed: aName [
	^ FileStream fileNamed: self demoPath , aName
]

{ #category : #text }
PDFDemos class >> textTest [
	"PDFDemos textTest"
	self new textTest: (self streamNamed: 'textTest.pdf')
]

{ #category : #draw }
PDFDemos class >> thicknessTest [
	"PDFDemos thicknessTest"
	self new thicknessTest: (self streamNamed: 'thicknessTest.pdf')
]

{ #category : #draw }
PDFDemos class >> twoColoredRectsTest [
	"PDFDemos twoColoredRectsTest"
	self new twoColoredRectsTest: (self streamNamed: 'twoColoredRectsTest.pdf')
]

{ #category : #layout }
PDFDemos class >> verticalLayoutTest [
	"PDFDemos verticalLayoutTest"
	self new verticalLayoutTest: (self streamNamed: 'verticalLayoutTest.pdf')
]

{ #category : #misc }
PDFDemos class >> widthTest [
	"PDFDemos widthTest"
	self new widthTest: (self streamNamed: 'widthTest.pdf')
]

{ #category : #templates }
PDFDemos >> CDTemplateTest: aStream [

	"PDFDemos CDTemplateTest"

	| pdfdoc |
	pdfdoc := PDFDocument new.
	pdfdoc add: (PDFCompactDiscTemplate new format: (PDFCompactDiscTemplate recommendedPageFormat)).
pdfdoc exportTo: aStream

]

{ #category : #templates }
PDFDemos >> DVDTemplateTest: aStream [

	"PDFDemos DVDTemplateTest"

	| pdfdoc |
	pdfdoc := PDFDocument new.
	pdfdoc add: (PDFDVDCoverTemplate new format: (PDFCompactDiscTemplate recommendedPageFormat)).
pdfdoc exportTo: aStream

]

{ #category : #text }
PDFDemos >> alignmentsTest: aStream [
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
pdfdoc exportTo: aStream

]

{ #category : #composite }
PDFDemos >> arrowTest: aStream [
	"drawing arrows"
	
	"self arrowTest"
	
	| pdfdoc aPage |
	pdfdoc := PDFDocument new uncompressed.	
	
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
	
pdfdoc exportTo: aStream

]

{ #category : #draw }
PDFDemos >> bezierTest: aStream [
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
	
pdfdoc exportTo: aStream

]

{ #category : #experimental }
PDFDemos >> brochure: aStream [
	"Artefact use an JPG file"

	"self brochure"

	| pdfdoc aPage titleFont subtitleFont titleColor layout |
	pdfdoc := PDFDocument new.
	titleColor := PDFColor new setColor: #(13 100 175).
	titleFont := PDFHelveticaFont new
		fontSize: 22 pt;
		bold: true.
	subtitleFont := PDFHelveticaFont new
		fontSize: 16 pt;
		bold: true.
	aPage := PDFPage new.
	aPage
		add:
			((PDFJpegElement fromStream: (StandardFileStream fileNamed: 'Pharo.jpg'))
				from: 15 mm @ 0 mm;
				wh: 160 mm @ 80 mm).
	layout := PDFVerticalLayout
		on:
			{(PDFFormattedTextElement new
				font: titleFont;
				textColor: titleColor;
				text: 'About Pharo').
			(PDFFormattedTextElement new
				textColor: titleColor;
				font: subtitleFont;
				text: 'Mission').
			(PDFParagraphElement new
				wh: 180 mm @ 50 mm;
				text:
						'Pharo''s goal is to deliver a clean, innovative, free open-source Smalltalk environment. By providing a stable and small core system, excellent developer tools, and maintained releases, Pharo is an attractive platform to build and deploy mission critical Smalltalk applications. Pharo is MIT licensed and is steered by a board of benevolent dictators. The board makes final decisions if no consensus can be reached within the community. Pharo fosters a healthy ecosystem of both private and commercial contributors who advance and maintain the core system and its external packages.').
			(PDFFormattedTextElement new
				textColor: titleColor;
				font: subtitleFont;
				text: 'Why Pharo?').
			(PDFParagraphElement new
				wh: 180 mm @ 50 mm;
				text:
						'Pharo is a fork from the Squeak open-source Smalltalk. We decided to start Pharo because as active Squeakers, and responsible for Squeak 3.9, we felt the need to reconsider choices made. We want to create a better Smalltalk and be free to enhance it without fear of backwards compatibility to Squeak. Deciding to start Pharo was not easy because we invested a lot in Squeak (some of us wrote several books on Squeak and in particular Squeak By Example) and we like the Squeak community, but this is really important for us to open a new space. We want Pharo to be an excellent Smalltalk concerned with software engineering practices. We also want Pharo to be agile and be able to evolve. We hope you will like it and help make it better.').
			(PDFFormattedTextElement new
				textColor: titleColor;
				font: subtitleFont;
				text: 'A word about changes').
			(PDFParagraphElement new
				wh: 180 mm @ 50 mm;
				text:
						'There is an important aspect behind Pharo: we want to make sure that Pharo is not a copy of the past but really a reinvention of Smalltalk. Now big-bang approaches rarely succeed. We will really favor evolutionary and incremental changes. We want to be able to experiment with important new features or libraries. For example, we need a new file library but that''s unlikely to happen in a day. Evolution means that we accept mistakes, we are not aiming for the next perfect solution in one big step -- even if we would love it. We will favor small incremental changes but a multitude of them. We will pay attention to your submissions to improve the system.')}.
	layout from: 15 mm @ 80 mm.
	aPage add: layout.
	pdfdoc add: aPage.
pdfdoc exportTo: aStream

]

{ #category : #draw }
PDFDemos >> capLineTest: aStream [
	"drawing simple lines with round cap"

	"self capLineTest"

	| pdfdoc aPage |
	pdfdoc := PDFDocument new.
	aPage := PDFPage new.
	aPage
		add:
			(PDFLineElement new
				from: 20 mm @ 20 mm;
				to: 100 mm @ 60 mm;
				thickness:  5 mm;
				drawColor: (PDFColor new setColor: #(100 25 100)) ;
				roundCap: true).
	aPage
		add:
			(PDFLineElement new
				from: 30 mm @ 40 mm;
				to: 110 mm @ 80 mm;
				drawColor: (PDFColor new setColor: #(240 80 100)) ;
				thickness:  5 mm).
				
	pdfdoc add: aPage.

pdfdoc exportTo: aStream

]

{ #category : #composite }
PDFDemos >> cellTest: aStream [
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
	
pdfdoc exportTo: aStream

]

{ #category : #draw }
PDFDemos >> circlesTest: aStream [
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
	
pdfdoc exportTo: aStream

]

{ #category : #color }
PDFDemos >> colorTest: aStream [
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
	
pdfdoc exportTo: aStream

]

{ #category : #composite }
PDFDemos >> datatableCustomizedElementTest: aStream [
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
																																																																																																										pdfdoc exportTo: aStream

]

{ #category : #composite }
PDFDemos >> datatableTest: aStream [
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
		wh: 190 mm @ 50 mm
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
		from: 10 mm @ 60 mm;
		wh: 190 mm @ 50 mm
	).
	
	pdfdoc add: aPage.
	
																																																									pdfdoc exportTo: aStream

]

{ #category : #composite }
PDFDemos >> datatableWithCaptionsTest: aStream [
	"generate a datatable with captions"
	
	| pdfdoc aPage |
		
	pdfdoc := PDFDocument new uncompressed.
	pdfdoc styleSheet > #dataTableWithColoredCaption > #caption at: #fillColor put: (PDFColor new setColor: { 158 . 158 .79 }).
	pdfdoc styleSheet > #dataTableWithColoredCaption > #caption at: #drawColor put: (PDFColor new setColor: { 158 . 158 .79 }).
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
		wh: 190 mm @ 60 mm;
		style: #dataTableWithColoredCaption;
		yourself																																
	).	

	aPage add: (PDFDataTableWithRowsCaptionElement new
		captions: #( 'Name' 'Surname' 'email');
		data: #(
			#('Smith' 'Jones' 'washington')
			#('Peter' 'Mickael' 'robert')
			#('peter.smith@mail.org' 'mickael.jones@epr.com' 'robert.washington@blif.com')
		);
		from: 10 mm @ 90 mm;
		wh: 190 mm @ 60 mm
	).
	
	pdfdoc add: aPage.
		
	
pdfdoc exportTo: aStream

]

{ #category : #'display setup' }
PDFDemos >> documentDisplayLayoutTest: aStream [
	"Configuration of display layout: singlePage, twoPages or continuousPages"

	"self documentDisplaylayoutTest"

	| pdfdoc aPage1 aPage2 |
	pdfdoc := PDFDocument new uncompressed; twoPages.
	aPage1  := PDFPage new.
	aPage1
		add:
			(PDFTextElement new
				from: 10 mm @ 10 mm;
				text: 'First page').						
	pdfdoc add: aPage1.
	aPage2  := PDFPage new.
	aPage2
		add:
			(PDFTextElement new
				from: 10 mm @ 10 mm;
				text: 'Second page').						
	pdfdoc add: aPage2.

pdfdoc exportTo: aStream

]

{ #category : #'display setup' }
PDFDemos >> documentDisplayModeTest: aStream [
	"Configuration of display mode: fullPage, fullWidth or real"

	"self documentDisplayModeTest"

	| pdfdoc aPage1 aPage2 |
	pdfdoc := PDFDocument new uncompressed; fullPage.
	aPage1  := PDFPage new.
	aPage1
		add:
			(PDFTextElement new
				from: 10 mm @ 10 mm;
				text: 'First page').						
	pdfdoc add: aPage1.
	aPage2  := PDFPage new.
	aPage2
		add:
			(PDFTextElement new
				from: 10 mm @ 10 mm;
				text: 'Second page').						
	pdfdoc add: aPage2.

pdfdoc exportTo: aStream

]

{ #category : #'display setup' }
PDFDemos >> documentZoomTest: aStream [
	"Configuration of zoom"

	"self documentZoomTest"

	| pdfdoc aPage1 aPage2 |
	pdfdoc := PDFDocument new uncompressed; zoom: 400. "set the zoom at 400%"
	aPage1  := PDFPage new.
	aPage1
		add:
			(PDFTextElement new
				from: 10 mm @ 10 mm;
				text: 'First page').						
	pdfdoc add: aPage1.
	aPage2  := PDFPage new.
	aPage2
		add:
			(PDFTextElement new
				from: 10 mm @ 10 mm;
				text: 'Second page').						
	pdfdoc add: aPage2.

pdfdoc exportTo: aStream

]

{ #category : #color }
PDFDemos >> drawStyleSheetTest: aStream [
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
	
pdfdoc exportTo: aStream

]

{ #category : #text }
PDFDemos >> euroTest: aStream [
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
	
pdfdoc exportTo: aStream

]

{ #category : #color }
PDFDemos >> greyLevelTest: aStream [
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
	
pdfdoc exportTo: aStream

]

{ #category : #layout }
PDFDemos >> horizontalLayoutTest: aStream [
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
pdfdoc exportTo: aStream

]

{ #category : #image }
PDFDemos >> imageJPG: aStream [
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
		aPage
		add:
			((PDFJpegElement
				fromStream: (StandardFileStream fileNamed: 'Pharo.jpg'))
				from: 40 mm @ 100 mm;
				wh: 40 mm  @ 40 mm;
				rotation: 10
				).
	aPage
		add:
			((PDFJpegElement
				fromStream: (StandardFileStream fileNamed: 'Pharo.jpg'))
				from: 40 mm @ 180 mm;
				wh: 40 mm  @ 40 mm;
				rotation: 30
				).
								
	pdfdoc add: aPage.
pdfdoc exportTo: aStream

]

{ #category : #document }
PDFDemos >> infosTest: aStream [
	"generate a sample document with informations"

	"self infosTest"
	
	| pdfdoc aPage |
	pdfdoc := PDFDocument new.
	
	pdfdoc metaData title: 'Le titre du document'; 
		subject: 'test de la zone d''information'; 
		author: 'Olivier Auverlot'; 
		keywords: 'test zone infos';
		creator: 'Artefact - Pharo'.
	
	aPage := PDFPage new.
	
	pdfdoc add: aPage.
		
pdfdoc exportTo: aStream

]

{ #category : #draw }
PDFDemos >> lineTest: aStream [
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
pdfdoc exportTo: aStream

]

{ #category : #document }
PDFDemos >> multiOrientationsTest: aStream [
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

pdfdoc exportTo: aStream

]

{ #category : #style }
PDFDemos >> multiStyleArrowsTest: aStream [
	"drawing arrows with differents styles"
	
	| pdfdoc aPage |
	pdfdoc := PDFDocument new uncompressed.	
	pdfdoc styleSheet > #redArrow at: #drawColor put: (PDFColor new setColor: #(243 24 24)).
	pdfdoc styleSheet	at: #drawColor put: (PDFColor new setColor: #(24 24 180)).
	pdfdoc styleSheet > #greenArrow at: #drawColor put: (PDFColor new setColor: #(24 180 24)).
	pdfdoc styleSheet > #greenArrow > #head at: #drawColor put: (PDFColor new setColor: #(255 0 0)).
	aPage := PDFPage new.
	
	aPage add: (PDFArrowElement new
		from: 10 mm @ 10 mm;
		to: 100 mm @30 mm;
		style: #redArrow
	).

	aPage add: (PDFArrowElement new
		from: 10 mm @20 mm;
		to: 30 mm @30 mm
	).

	aPage add: (PDFArrowElement new
		from: 10 mm @ 15 mm;
		to: 70 mm @30 mm;
		style: #greenArrow
	).
			
	pdfdoc add: aPage.
	
pdfdoc exportTo: aStream

]

{ #category : #cool }
PDFDemos >> oneLineTest: aStream [
	PDFDocument new add: (PDFPage new add: (PDFTextElement new text: 'Hello'; from: 10mm@10mm)); exportTo: aStream

]

{ #category : #composite }
PDFDemos >> paragraphTest: aStream [
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
	
pdfdoc exportTo: aStream

]

{ #category : #composite }
PDFDemos >> paragraphWithSpacingTest: aStream [
	"Use of paragraphs"
	
	"self paragraphWithSpacingTest"
	
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
		spacing: 0.5mm;
		text: '2 Quam ob rem ut ii qui superiores sunt submittere se debent in amicitia, sic quodam modo inferiores extollere. Sunt enim quidam qui molestas amicitias faciunt, cum ipsi se contemni putant; quod non fere contingit nisi iis qui etiam contemnendos se arbitrantur; qui hac opinione non modo verbis sed etiam opere levandi sunt.').

	aPage add: (PDFParagraphElement new 
		from: 100 mm @ 80 mm;
		wh: 60 mm @ 70 mm; 
		spacing: 1mm;
		text: '3 Denique Antiochensis ordinis vertices sub uno elogio iussit occidi ideo efferatus, quod ei celebrari vilitatem intempestivam urgenti, cum inpenderet inopia, gravius rationabili responderunt; et perissent ad unum ni comes orientis tunc Honoratus fixa constantia restitisset.';
		center).
		
	aPage add: (PDFParagraphElement new 
		from: 10 mm @ 120 mm;
		wh: 60 mm @ 80 mm; 
		spacing: 3 mm;
		text: '4 Igitur per multiplices dilatata fortunas cum ambigerentur quaedam, non nulla levius actitata constaret, post multorum clades Apollinares ambo pater et filius in exilium acti cum ad locum Crateras nomine pervenissent, villam scilicet suam quae ab Antiochia vicensimo et quarto disiungitur lapide, ut mandatum est, fractis cruribus occiduntur.';
		right
		).
		
	pdfdoc add: aPage.
	
pdfdoc exportTo: aStream

]

{ #category : #draw }
PDFDemos >> polygonsTest: aStream [
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
	
	aPage add: (PDFPolygonElement new 
		from: 10 mm @ 55 mm; 
		to: { 60 mm @  60 mm  . 50 mm @ 100  mm . 30 mm @ 110 mm . 15 mm @ 105  mm };
		drawColor: (PDFColor new setColor: #(0 0 255));
		fillColor: (PDFColor new setColor: #(255 0 0));
		thickness: 5 mm	
	).
	pdfdoc add: aPage.
	

pdfdoc exportTo: aStream

]

{ #category : #draw }
PDFDemos >> rectsTest: aStream [
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

pdfdoc exportTo: aStream

]

{ #category : #text }
PDFDemos >> textTest: aStream [
	"PDFDemos textTest"

	| pdfdoc myFont aPage myFontInMilliMeters |
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
						from: 10 mm @ 85 mm;
						text: 'A text with font expressed in mm (5)');
		add:
				(PDFLineElement new
						from: 10 mm @ 85 mm;
						to: 160 mm @ 85 mm);
		add:
				(PDFLineElement new
						from: 10 mm @ 90 mm;
						to: 160 mm @ 90 mm).
	pdfdoc add: aPage.
pdfdoc exportTo: aStream

]

{ #category : #draw }
PDFDemos >> thicknessTest: aStream [
	"generate a sample document for testing the draw objects"

	"self thicknessTest"
	
	| pdfdoc aPage xy1 xy2 |

	pdfdoc := PDFDocument new.	
	aPage := PDFPage new.
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
		
	pdfdoc exportTo: aStream

]

{ #category : #draw }
PDFDemos >> twoColoredRectsTest: aStream [
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
	
pdfdoc exportTo: aStream

]

{ #category : #layout }
PDFDemos >> verticalLayoutTest: aStream [
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
pdfdoc exportTo: aStream

]

{ #category : #misc }
PDFDemos >> widthTest: aStream [
	"generate a sample document for testing the width of fonts"

	"PDFDemos widthTest"
	
	| pdfdoc aPage myFont width text |

	pdfdoc := PDFDocument new.	
			
	myFont := PDFTimesFont new fontSize: 16 pt.
	text := 'Hello World !'.

	aPage := PDFPage new.
	
	width := myFont getStringWidth: text.
	
	aPage add: (PDFCellElement new from: 5mm@10mm; font: myFont; wh: width@10mm; text: text).

	pdfdoc add: aPage.
	
		
pdfdoc exportTo: aStream

]
