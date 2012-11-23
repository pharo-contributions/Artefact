Class {
	#name : #PDFDemos,
	#superclass : #Object,
	#classInstVars : [
		'demoPath'
	],
	#category : #'Artefact-Demos'
}

{ #category : #text }
PDFDemos class >> alignmentsTest [

	"a simple demonstration of Artefact"
	
	"PDFDemos alignmentsTest"
	
	| pdfdoc myFont myBigFont aPage |
	pdfdoc := PDFDocument new.	

	myFont := PDFHelveticaFont new fontSize: 16.
	
	aPage := PDFPage new.

	aPage add: (PDFFormatedTextElement new 
		font: myFont; 
		wh: 150@10; 
		from: 0@0;
		text: 'At left'
	).
	aPage add: (PDFFormatedTextElement new 
		font: myFont; 
		wh: 150@10; 
		from: 10@20;
		text: 'Center'; 
		center
	).
	aPage add: (PDFFormatedTextElement new 
		font: myFont; 
		wh: 150@10; 
		from: 10@30;
		text: 'At right'; 
		right
	).
	pdfdoc add: aPage.
	
	pdfdoc exportToFile: self demoPath , 'alignmentsTest.pdf'.
]

{ #category : #draw }
PDFDemos class >> alineTest [
	"drawing with simple line"
	
	"self alineTest"
	
	| pdfdoc aPage |
	pdfdoc := PDFDocument new.	
	
	aPage := PDFPage new.

	aPage add: (PDFLineElement new from: 0@0; to: 210@60).
			
	pdfdoc add: aPage.
	
	pdfdoc exportToFile: self demoPath  , 'alinedTest.pdf'.
]

{ #category : #composite }
PDFDemos class >> arrowTest [
	"drawing arrows"
	
	"self arrowTest"
	
	| pdfdoc aPage |
	pdfdoc := PDFDocument new.	
	
	aPage := PDFPage new.
	
	aPage add: (PDFArrowElement new
		from: 10@10;
		to: 100@30;
		drawColor: (PDFColor new setColor: #(255 0 0))
	).

	aPage add: (PDFArrowElement new
		from: 10@20;
		to: 30@30
	).

	aPage add: (PDFArrowElement new
		from: 120@10;
		to: 120@40;
		drawColor: (PDFColor new setColor: #(0 0 255))
	).

	aPage add: (PDFArrowElement new
		from: 125@40;
		to: 140@40;
		drawColor: (PDFColor new setColor: #(0 0 255))
	).

	aPage add: (PDFArrowElement new
		from: 125@40;
		to: 100@80;
		drawColor: (PDFColor new setColor: #(0 255 0));
		dotted: (PDFDotted new length: 2; space: 3)
	).	

	aPage add: (PDFArrowElement new
		from: 40@50;
		to: 80@90;
		drawColor: (PDFColor new setColor: #(192 255 0));
		thickness:  2
	 ).		
	
	aPage add: (PDFDoubleArrowElement new
		from: 10@80;
		to: 100@150;
		drawColor: (PDFColor new setColor: #(0 128 0));
		dotted: (PDFDotted new length: 2; space: 2)
	).
			
	pdfdoc add: aPage.
	
	pdfdoc exportToFile: self demoPath  , 'arrowTest.pdf'.
]

{ #category : #draw }
PDFDemos class >> bezierTest [
	"drawing bezier curves"
	
	"self bezierTest"
	
	| pdfdoc aPage |
	pdfdoc := PDFDocument new.	
	
	aPage := PDFPage new.

	aPage add: (PDFBezierCurveElement new 
		from: 10@50;
		to: { 100@10 . 140@100 . 200@30 };
		thickness: 5
	).
	
	pdfdoc add: aPage.
	
	pdfdoc exportToFile: self demoPath  , 'bezierTest.pdf'.
]

{ #category : #composite }
PDFDemos class >> cellTest [
	"self cellTest"
	
	"Demonstration of PDFCellElement"
	
	| pdfdoc myFont myTitleFont aPage |
	pdfdoc := PDFDocument new.	

	myTitleFont := PDFTimesFont new fontSize: 24; bold: true.
	
	aPage := PDFPage new.

	aPage add: (PDFCellElement new
		from: 10@5;
		wh: 190@10;
		fillColor: (PDFColor new setGreyLevel: 224);
		text: 'Demonstration of PDFCellStyle';
		font: myTitleFont;
		center
	).
	
	"horizontal alignment"
	aPage add: (PDFCellElement new  
		from: 10@20;
		wh: 50@10;
		text: 'alignment: left';
		left
	).
	
	aPage add: (PDFCellElement new  
		from: 80@20;
		wh: 50@10;
		text: 'alignment: center'
	 ).
	
	aPage add: (PDFCellElement new  
		from: 150@20;
		wh: 50@10;
		text: 'alignment: right';
		right
	).

	"vertical alignment"
	aPage add: (PDFCellElement new  
		from: 10@40;
		wh: 50@10;
		text: 'vertical: top';
		left;
		top
	).
	
	aPage add: (PDFCellElement new  
		from: 80@40;
		wh: 50@10;
		text: 'vertical: middle';
		center;
		middle
	).
	
	aPage add: (PDFCellElement new  
		from: 150@40;
		wh: 50@10;
		text: 'vertical: bottom';
		right;
		bottom
	).

	"colors"
	aPage add: (PDFCellElement new  
		from: 10@60;
		wh: 50@10;
		textColor: (PDFColor new setColor: #(0 0 255));
		drawColor: (PDFColor new setColor: #(255 0 0));
		text: 'text: blue border: red';
		center;
		middle
	).
	
	aPage add: (PDFCellElement new  
		from: 80@60;
		wh: 50@10;
		textColor: (PDFColor new setColor: #(0 0 255));
		fillColor: (PDFColor new setColor: #(0 255 0));
		text: 'background: green';
		center;
		middle
	).
	
	aPage add: (PDFCellElement new  
		from: 150@60;
		wh: 50@10;
		textColor: (PDFColor new setGreyLevel: 255);
		fillColor: (PDFColor new setGreyLevel: 128);
		dotted: (PDFDotted new length: 1; space: 1);
		text: 'grey level & dotted border';
		thickness: 0.2;
		center;
		middle
	).
	
	aPage add: (PDFCellElement new  
		from: 10@80;
		text: 'A cell without wh'
	).
	aPage add: (PDFCellElement new  
		wh: 50@10;
		text: 'A cell without xy'
	).
	aPage add: (PDFCellElement new  
		wh: 50@10;
		text: 'linefeed: true';
		linefeed: true
	).
	aPage add: (PDFCellElement new  
		wh: 50@10;
		text: 'linefeed: false';
		linefeed: false
	).
	aPage add: (PDFCellElement new  
		wh: 50@10;
		text: 'end'
	).

	
	pdfdoc add: aPage.
	
	pdfdoc exportToFile: self demoPath , 'cellTest.pdf'.
]

{ #category : #draw }
PDFDemos class >> circlesTest [
	"drawing circles"
	
	"self circlesTest"
	
	| pdfdoc aPage |
	pdfdoc := PDFDocument new.	
	
	aPage := PDFPage new.

	aPage add: (PDFCircleElement new 
		from: 50@50;
		radius: 30
	).

	aPage add: (PDFFilledCircleElement new 
		from: 120@50;
		radius: 30;
		fillColor: (PDFColor new setColor: #(0 255 0));
		drawColor: (PDFColor new setColor: #(255 0 0))
	).
	
	pdfdoc add: aPage.
	
	pdfdoc exportToFile: self demoPath  , 'circlesTest.pdf'.
]

{ #category : #color }
PDFDemos class >> colorTest [
	"generate a sample document with colors"

	"self colorTest"
	
	| pdfdoc aPage myFont |
	pdfdoc := PDFDocument new.
	
	aPage := PDFPage new.
	aPage add: (PDFCellElement new 
		font: (PDFTimesFont new fontSize: 32);
		wh: 100@20; 
		border: true; 
		text: 'Hello World!';
		ink: (PDFColor new setColor: #(255 0 0) );
		fillColor: (PDFColor new setColor: #(0 255 0))
		).
	aPage add: (PDFRectElement new 
		from: 10@50;
		wh: 50@50; 
		width: 5;
		ink: (PDFColor new setColor: #(0 0 255));
		fillColor: (PDFColor new setColor: #(0 255 0))
		).
		
	pdfdoc add: aPage.
	
	pdfdoc exportToFile: self demoPath , 'colorTest.pdf'.

]

{ #category : #composite }
PDFDemos class >> datatableCustomizedElementTest [
	"generate a customized datatable"

	"self datatableCustomizedElementTest"
	
	| pdfdoc aPage |
		
	pdfdoc := PDFDocument new.
	pdfdoc setFormat: PDFA4Format new.
	pdfdoc title: 'Users report'.
	
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
		from: 10@20;
		wh: 40@5
	). 
	
	pdfdoc add: aPage.
		
	pdfdoc exportToFile: self demoPath , 'datatableCustomizedStyleTest.pdf'.

	
	
]

{ #category : #composite }
PDFDemos class >> datatableTest [
	"generate a datatable"

	"self datatableTest"
	
	| pdfdoc aPage |
		
	pdfdoc := PDFDocument new.
	pdfdoc setFormat: PDFA4Format new.
	pdfdoc title: 'Users report'.
	
	aPage := PDFPage new.
	aPage add: (PDFDataTableElement new
		data: #(
			#('Smith' 'Peter' 'peter.smith@mail.org')
			#('Jones' 'Mickael' 'mickael.jones@epr.com')
			#('washington' 'robert' 'robert.washington@blif.com')
		);
		from: 10@10;
		wh: 60@5
	).

	aPage add: (PDFDataTableElement new
		data: #(
			#('Smith' 'Peter' 'peter.smith@mail.org')
			#('Jones' 'Mickael' 'mickael.jones@epr.com')
			#('washington' 'robert' 'robert.washington@blif.com')
		);
		textColor:(PDFColor new setColor: #(0 0 255));
		fillColor: (PDFColor new setGreyLevel: 230);
		font: (PDFTimesFont new fontSize: 6);
		dotted: (PDFDotted new length: 0.2; space: 0.2);
		from: 10@30;
		wh: 30@5
	).
	
	pdfdoc add: aPage.
		
	pdfdoc exportToFile: self demoPath , 'datatableTest.pdf'.

	
	
]

{ #category : #composite }
PDFDemos class >> datatableWithCaptionsTest [
	"generate a datatable with captions"

	"self datatableWithCaptionsTest"
	
	| pdfdoc aPage |
		
	pdfdoc := PDFDocument new.
	pdfdoc setFormat: PDFA4Format new.
	pdfdoc title: 'Users report'.
	
	aPage := PDFPage new.
	
	aPage add: (PDFDataTableWithColumnsCaptionElement new
		captions: #( 'Name' 'Surname' 'email');
		data: #(
			#('Smith' 'Peter' 'peter.smith@mail.org')
			#('Jones' 'Mickael' 'mickael.jones@epr.com')
			#('washington' 'robert' 'robert.washington@blif.com')
		);
		from: 10@20;
		wh: 40@5;
		captionColor: (PDFColor new setGreyLevel: 192)
	).	

	aPage add: (PDFDataTableWithRowsCaptionElement new
		captions: #( 'Name' 'Surname' 'email');
		data: #(
			#('Smith' 'Jones' 'washington')
			#('Peter' 'Mickael' 'robert')
			#('peter.smith@mail.org' 'mickael.jones@epr.com' 'robert.washington@blif.com')
		);
		from: 10@50;
		wh: 40@5;
		captionColor: (PDFColor new setGreyLevel: 192)
	).
	
	pdfdoc add: aPage.
		
	pdfdoc exportToFile: self demoPath , 'datatableWithCaptionsTest.pdf'.

	
	
]

{ #category : #'as yet unclassified' }
PDFDemos class >> demo [
	"a simple demonstration of Artefact"
	
	"PDFDemos demo"
	
	| pdfdoc myFont myBigFont aPage |
	pdfdoc := PDFDocument new.	

	myBigFont := PDFCourierFont new fontSize: 36; bold: true.
	myFont := PDFHelveticaFont new fontSize: 16.
	
	aPage := PDFPage new.

	aPage add: (PDFCellElement new 
		font: myBigFont; 
		wh: 100@60; 
		border: true; 
		linefeed: true; 
		textColor: (PDFColor new setColor: #(0 255 0));
		text: 'Première ligne').
		
	aPage add: (PDFCellElement new 
		font: myBigFont;
		wh: 100@24; 
		border: true; 
		linefeed: true;
		textColor: (PDFColor new setColor: #(128 128 0)); 
		text: 'Artefact').
	
	aPage add: (PDFCellElement new 
		font: myFont; 
		wh: 100@10; 
		border: true; 
		linefeed: true; 
		textColor: (PDFColor new setColor: #(0 0 0));
		text: 'PDF Framework for Pharo').
			
	aPage add: (PDFLineElement new from: 10@10; to: 20@10; drawColor: (PDFColor new setColor: #(255 0 0))).
	aPage add: (PDFLineElement new from: 10@10; to: 10@20; drawColor:(PDFColor new setColor: #(255 0 0))).

	
	pdfdoc add: aPage.
	pdfdoc explore.
	
	pdfdoc exportToFile: self demoPath , 'demo.pdf'.
]

{ #category : #accessing }
PDFDemos class >> demoPath [
	^'/Users/larcheveque/pdf/'
]

{ #category : #draw }
PDFDemos class >> dottedTest [
	"drawing with dotted"
	
	"self dottedTest"
	
	| pdfdoc aPage |
	pdfdoc := PDFDocument new.	
	
	aPage := PDFPage new.
	
	aPage add: (PDFLineElement new from: 0@0; to: 30@0).
	aPage add: (PDFLineElement new from: 0@0; to: 0@30).
	aPage add: (PDFLineElement new from: 0@5; to: 150@5).
	
	aPage add: (PDFLineElement new
		from: 10@10;
		to: 100@30;
		dotted: (PDFDotted new length: 2; space: 3)
	).
	
	aPage add: (PDFLineElement new
		from: 30@30;
		to: 80@50;
		dotted: (PDFDotted new)
	).

	aPage add: (PDFLineElement new
		from: 10@10;
		to: 10@50
	 ).
	
	aPage add: (PDFRectElement new
		from: 80@80;
		wh: 100@30; 
		dotted: (PDFDotted new length: 5; space: 3);
		thickness:  2
		).
			
	pdfdoc add: aPage.
	
	pdfdoc exportToFile: self demoPath  , 'dottedTest.pdf'.
]

{ #category : #color }
PDFDemos class >> drawStyleSheetTest [
	"generate a sample document with colors"

	"self drawStyleSheetTest"
	
	| pdfdoc aPage myFont |
	pdfdoc := PDFDocument new.
	
	aPage := PDFPage new.

	aPage add: (PDFRectElement new 
		from: 10@50;
		wh: 50@50; 
		thickness: 5;
		drawColor: (PDFColor new setColor: #(0 0 255));
		fillColor: (PDFColor new setColor: #(0 255 0))
		).
		
	aPage add: (PDFRectElement new 
		from: 50@60;
		wh: 50@50).
		
	pdfdoc add: aPage.
	
	pdfdoc exportToFile: self demoPath , 'drawStyleSheetTest.pdf'.

]

{ #category : #text }
PDFDemos class >> euroTest [
	"a PDF document with the euro sign"

	"PDFDemos euroTest"
	| pdfdoc aPage theText|

       pdfdoc := PDFDocument new.

       aPage := PDFPage new.
	theText :=  ('Price: (24{1})A\B' format: { (128 asCharacter) asString} ).
	
       aPage add: (PDFTextElement new from: 50@10; text: theText; font: (PDFTimesFont new)).
       aPage add: (PDFTextElement new from: 50@20; text: theText; font: (PDFCourierFont new)).
       aPage add: (PDFTextElement new from: 50@30; text: theText; font: (PDFHelveticaFont  new)).

	pdfdoc add: aPage.
	
       pdfdoc exportToFile: self demoPath , 'euroTest.pdf'.
]

{ #category : #color }
PDFDemos class >> greyLevelTest [
	"generate a sample document with grey levels"

	"self greyLevelTest"
	
	| pdfdoc aPage myFont |
	pdfdoc := PDFDocument new.
	
	aPage := PDFPage new.

	aPage add: (PDFTextElement new 
		from: 10@10; 
		text: 'A grey level text'; 
		font: (PDFCourierFont new);
		ink: (PDFColor new setGreyLevel: 128)
		).
		
	aPage add: (PDFRectElement new 
		from: 10@20;
		wh: 50@50; 
		width: 5;
		ink: (PDFColor new setGreyLevel: 196);
		fillColor: (PDFColor new setGreyLevel: 164)
		).
		
	pdfdoc add: aPage.
	
	pdfdoc exportToFile: self demoPath , 'greyLevelTest.pdf'.

]

{ #category : #experimental }
PDFDemos class >> headerFooterTest [
	"generate a sample document with a header and a footer"

	"self headerFooterTest"
	
	| pdfdoc aPage secondPage myFont |

	myFont := PDFCourierFont new fontSize: 32.

	pdfdoc := PDFDocument new.
	
	aPage := PDFPage new.
	aPage add: (PDFCellElement new 
		font: myFont;
		text: 'Header and Footer test').

	pdfdoc add: aPage.

	secondPage := PDFPage new.
	secondPage add: (PDFCellElement new 
		font: myFont;
		text: 'Header and Footer test').	
			
	"secondPage header: false; footer: false."
	pdfdoc add: secondPage.		
			
	pdfdoc exportToFile: self demoPath , 'headerFooterTest.pdf'.

	
	
]

{ #category : #experimental }
PDFDemos class >> imagePNG [
	"Artefact use an PNG file"
	
	"self imagePNG"
	
	| pdfdoc myImage aPage |
	pdfdoc := PDFDocument new.	
	myImage := PDFPNGImage new fileName: '/Users/olivier/Desktop/artefact/phare.png'.
	myImage inspect.
	
	aPage := PDFPage new.
	"aPage add: (PDFImageStyle new image: myImage; 
		xy: 5@5; 
		wh: 100@30)."
	pdfdoc add: aPage.
	
	pdfdoc exportToFile: '/Users/olivier/Desktop/demo.pdf'.
]

{ #category : #document }
PDFDemos class >> infosTest [
	"generate a sample document with informations"

	"self infosTest"
	
	| pdfdoc aPage aSecondPage |
	pdfdoc := PDFDocument new.
	
	pdfdoc title: 'Le titre du document'; 
		subject: 'test de la zone d''information'; 
		author: 'Olivier Auverlot'; 
		keywords: 'test zone infos';
		creator: 'Artefact - Pharo'.
	
	aPage := PDFPage new.
	
	pdfdoc add: aPage.
	pdfdoc exportToFile: self demoPath , 'infosTest.pdf'.

	
	
]

{ #category : #draw }
PDFDemos class >> lineTest [
	"drawing with simple lines around the page"
	
	"self lineTest"
	
	| pdfdoc aPage |
	pdfdoc := PDFDocument new.	
	
	aPage := PDFPage new.

	aPage add: (PDFLineElement new from: 0@0; to: 210@0).
	aPage add: (PDFLineElement new from: 0@0; to: 0@297).
	aPage add: (PDFLineElement new from: 0@297; to: 210@297).
	aPage add: (PDFLineElement new from: 210@297; to: 210@0).
			
	pdfdoc add: aPage.
	
	pdfdoc exportToFile: self demoPath  , 'lineTest.pdf'.
]

{ #category : #document }
PDFDemos class >> multiOrientationsTest [
	"Create a document with two pages and two different orientations"
	
	"self multiOrientationsTest"
	
	| pdfdoc myBigFont firstPage secondPage myLandscapeFormat |
	pdfdoc := PDFDocument new.	

	myLandscapeFormat := PDFA3Format new setLandscape.
	
	myBigFont := PDFTimesFont new fontSize: 16.
	
	firstPage := PDFPage new.	
	firstPage add: (PDFCellElement new 
		font: myBigFont; 
		wh: 40@10; 
		text: 'Page 1').
	
	secondPage := PDFPage new format: myLandscapeFormat.
	
	secondPage add: (PDFCellElement new 
		font: myBigFont; 
		wh: 40@10; 
		text: 'Page en A3').	
			
	pdfdoc add: firstPage.
	pdfdoc add: secondPage.

	pdfdoc exportToFile: self demoPath , 'multiOrientationsTest.pdf'.
]

{ #category : #composite }
PDFDemos class >> paragraphTest [
	"Use of paragraphs"
	
	"self paragraphTest"
	
	| pdfdoc aPage |
	pdfdoc := PDFDocument new.	
	
	aPage := PDFPage new.

	aPage add: (PDFParagraphElement new 
		from: 90@40;
		wh: 100@20; 
		text: '1 Emensis itaque difficultatibus multis et nive obrutis callibus plurimis ubi prope Rauracum ventum est ad supercilia fluminis Rheni, resistente multitudine Alamanna pontem suspendere navium conpage Romani vi nimia vetabantur ritu grandinis undique convolantibus telis, et cum id inpossibile videretur, imperator cogitationibus magnis attonitus, quid capesseret ambigebat.').

	aPage add: (PDFParagraphElement new 
		from: 20@40;
		wh: 60@60; 
		text: '2 Quam ob rem ut ii qui superiores sunt submittere se debent in amicitia, sic quodam modo inferiores extollere. Sunt enim quidam qui molestas amicitias faciunt, cum ipsi se contemni putant; quod non fere contingit nisi iis qui etiam contemnendos se arbitrantur; qui hac opinione non modo verbis sed etiam opere levandi sunt.').

	aPage add: (PDFParagraphElement new 
		from: 100@80;
		wh: 60@70; 
		text: '3 Denique Antiochensis ordinis vertices sub uno elogio iussit occidi ideo efferatus, quod ei celebrari vilitatem intempestivam urgenti, cum inpenderet inopia, gravius rationabili responderunt; et perissent ad unum ni comes orientis tunc Honoratus fixa constantia restitisset.';
		center).
		
	aPage add: (PDFParagraphElement new 
		from: 10@120;
		wh: 60@80; 
		text: '4 Igitur per multiplices dilatata fortunas cum ambigerentur quaedam, non nulla levius actitata constaret, post multorum clades Apollinares ambo pater et filius in exilium acti cum ad locum Crateras nomine pervenissent, villam scilicet suam quae ab Antiochia vicensimo et quarto disiungitur lapide, ut mandatum est, fractis cruribus occiduntur.';
		right
		).
		
	pdfdoc add: aPage.
	
	pdfdoc exportToFile: self demoPath , 'paragraph.pdf'.
]

{ #category : #draw }
PDFDemos class >> polygonsTest [
	"drawing polygons"
	
	"self polygonsTest"
	
	| pdfdoc aPage |
	pdfdoc := PDFDocument new.	
	
	aPage := PDFPage new.

	aPage add: (PDFPolygonElement new 
		from: 10@10; 
		to: { 60@20 . 50@40 . 30@50 . 15@45 };
		drawColor: (PDFColor new setColor: #(0 0 255))
	).
	
	aPage add: (PDFFilledPolygonElement new 
		from: 10@55; 
		to: { 60@60 . 50@100 . 30@110 . 15@105 };
		drawColor: (PDFColor new setColor: #(0 0 255));
		fillColor: (PDFColor new setColor: #(255 0 0));
		thickness: 5	
	).
	pdfdoc add: aPage.
	
	pdfdoc exportToFile: self demoPath  , 'polygonsTest.pdf'.
]

{ #category : #draw }
PDFDemos class >> rectsTest [
	"intersecting rects"
	
	"self rectsTest"
	
	| pdfdoc aPage |
	pdfdoc := PDFDocument new.	
	
	aPage := PDFPage new.
	
	aPage add: (PDFRectElement new
		from: 0@0;
		wh: 210@297
	).
	aPage add: (PDFRectElement new
		from: 10@10;
		wh: 100@30 ).
	aPage add: (PDFFilledRectElement new
		from: 15@15;
		wh: 100@30;
		fillColor: (PDFColor new setColor: #(142 24 78))
		).		
	aPage add: (PDFRectElement new
		from: 20@20;
		wh: 100@30;
		drawColor: (PDFColor new setColor: #(0 255 0)) 
		).
	pdfdoc add: aPage.

	pdfdoc exportToFile: self demoPath  , 'rectsTest.pdf'.
]

{ #category : #text }
PDFDemos class >> textTest [
	"PDFDemos textTest"
	
	| pdfdoc myFont myBigFont aPage |
	pdfdoc := PDFDocument new.	

	myFont := PDFTimesFont new fontSize: 24.
	
	aPage := PDFPage new.

	aPage add: (PDFTextElement new  
		from: 10@10;
		text: 'A very simple text'
	).
	aPage add: (PDFTextElement new 
		font: myFont; 
		from: 10@30; 
		text: 'A very simple text with specified font'
	).
	aPage add: (PDFTextElement new 
		textColor: (PDFColor new setColor: #(255 0 0 ));
		from: 10@50; 
		text: 'A very simple text with specified color'
	).
	aPage add: (PDFTextElement new 
		textColor: (PDFColor new setColor: #(0 0 255 ));
		font: myFont; 
		from: 10@70; 
		text: 'A very simple text with specified color and font'
	).
	pdfdoc add: aPage.
	
	pdfdoc exportToFile: self demoPath , 'textTest.pdf'.
]

{ #category : #draw }
PDFDemos class >> thicknessTest [
	"generate a sample document for testing the draw objects"

	"self thicknessTest"
	
	| pdfdoc aPage width xy1 xy2 |

	pdfdoc := PDFDocument new.	
	aPage := PDFPage new.
	width := 1.
	xy1 := 10@20.
	xy2 := 100@20.
	
	1 to: 5 do: [ :i |
		aPage add: (PDFLineElement new from: xy1; to: xy2; thickness: i).
		xy1 := (xy1 x) @ (xy1 y + 10).
		xy2 := (xy2 x) @ (xy2 y + 10).
	].	
	
	aPage add: (PDFRectElement new 
		from: 50@80;
		wh: 50@50; 
		thickness:  5
		).
	
	pdfdoc add: aPage.
	
	pdfdoc exportToFile: self demoPath , 'thicknessTest.pdf'.

	
	
]

{ #category : #draw }
PDFDemos class >> twoColoredRectsTest [
	"intersecting rects"
	
	"self twoColoredRectsTest"
	
	| pdfdoc aPage |
	pdfdoc := PDFDocument new.	
	
	aPage := PDFPage new.
	
	aPage add: (PDFRectElement new
		from: 10@10;
		wh: 100@30;
		fillColor: (PDFColor new setColor: #(142 24 78));
		drawColor: (PDFColor new setColor: #(255 0 0))).
	aPage add: (PDFRectElement new
		from: 15@15;
		wh: 100@30;
		fillColor: (PDFColor new setColor: #(24 57 205));
		drawColor: (PDFColor new setColor: #(0 255 0))).		
	pdfdoc add: aPage.
	
	pdfdoc exportToFile: self demoPath  , 'twoColoredRectTest.pdf'.
]

{ #category : #'as yet unclassified' }
PDFDemos class >> unCarresDansUnCarreStyle [
	"un test de style géométrique"
	
	"self unCarresDansUnCarreStyle"
	
	| pdfdoc aPage |
	pdfdoc := PDFDocument new.	
	
	aPage := PDFPage new.
	
	aPage add: (UnCarreDansUnCarre new
		from: 10@10;
		wh: 100@30;
		borderSize: 5@2 ).
		
	pdfdoc add: aPage.
	
	pdfdoc exportToFile: '/home/olivier/Desktop/deuxCarreDansUnCarre.pdf'.
]

{ #category : #'as yet unclassified' }
PDFDemos class >> widthTest [
	"generate a sample document for testing the width of fonts"

	"PDFDemos widthTest"
	
	| pdfdoc aPage myFont myBigFont width text size |

	pdfdoc := PDFDocument new.	
			
	myFont := PDFTimesFont new fontSize: 16.
	myBigFont := PDFTimesFont new fontSize: 1.
	text := 'Hello World !'.

	"myBigFont fontSize: (myBigFont getIdealFontSizeForTheString: text width: 100 into: pdfdoc).	"

	aPage := PDFPage new.
	"aPage add: (PDFCellStyle new wh: 100@32; border: true; linefeed: true; text: 'Une première ligne')."
	
	width := myFont getStringWidth: text into: pdfdoc.
	
	aPage add: (PDFCellElement new font: myFont; wh: width@10; border: true; linefeed: true; text: text).

	"aPage add: (PDFCellStyle new font: myBigFont; wh: 100@10; border: true; linefeed: true; text: text)."
	
	"Transcript show: pdfdoc margins asString."
	aPage add: (PDFLineElement new from: 10@60; to: 110@60).
	pdfdoc add: aPage.
	
	pdfdoc exportToFile: self demoPath , 'widthTest.pdf'.

	
	
]
