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
	
	"PDFDemos alignments"
	
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
	
	pdfdoc exportToFile: self demoPath , 'alignmentsTest.pdf'.
]

{ #category : #color }
PDFDemos class >> colorTest [
	"generate a sample document with colors"

	"self colorTest"
	
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
	aPage add: (PDFRectStyle new 
		xy: 10@50;
		wh: 50@50; 
		width: 5;
		ink: (PDFColor new setColor: #(0 0 255));
		fillColor: (PDFColor new setColor: #(0 255 0))
		).
		
	pdfdoc add: aPage.
	
	pdfdoc exportToFile: self demoPath , 'colorTest.pdf'.

]

{ #category : #highLevel }
PDFDemos class >> datatableTest [
	"generate a datatable"

	"self datatableTest"
	
	| pdfdoc aPage |
		
	pdfdoc := PDFDocument new.
	pdfdoc setFormat: PDFA4Format new.
	pdfdoc title: 'Users report'.
	
	aPage := PDFPage new.
	aPage add: (PDFDataTableStyle new columns: #('Name'  'Surname' 'email');
		data: #(
			#('Smith' 'Peter' 'peter.smith@mail.org')
			#('Jones' 'Mickael' 'mickael.jones@epr.com')
			#('washington' 'robert' 'robert.washington@blif.com')
		);
		inkForColumns: (PDFColor new setColor: #(0 0 0));
		fillColorForColumns: (PDFColor new setGreyLevel: 196);
		ink: (PDFColor new setColor: #(0 0 0));
		fillColor: (PDFColor new setGreyLevel: 230);
		font: (PDFHelveticaFont new fontSize: 10);
		xy: 10@10;
		wh: 60@5	
	  ).
	pdfdoc add: aPage.
		
	pdfdoc exportToFile: self demoPath , 'datatableTest.pdf'.

	
	
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

	
	aPage add: (PDFCellStyle new 
		font: myBigFont; 
		wh: 100@60; 
		border: true; 
		linefeed: true; 
		ink: (PDFColor new setColor: #(0 255 0));
		text: 'Première ligne').
		
	aPage add: (PDFCellStyle new 
		font: myBigFont;
		wh: 100@24; 
		border: true; 
		linefeed: true;
		ink: (PDFColor new setColor: #(128 128 0)); 
		text: 'Artefact').
	
	aPage add: (PDFCellStyle new 
		font: myFont; 
		wh: 100@10; 
		border: true; 
		linefeed: true; 
		text: 'PDF Framework for Pharo').
	
	aPage add: (PDFLineStyle new xy: 10@10; destination: 20@10; ink:(PDFColor new setColor: #(255 0 0))).
	aPage add: (PDFLineStyle new xy: 10@10; destination: 10@20; ink:(PDFColor new setColor: #(255 0 0))).

	
	pdfdoc add: aPage.
	
	pdfdoc exportToFile: self demoPath , 'demo.pdf'.
]

{ #category : #accessing }
PDFDemos class >> demoPath [
	^'/Users/olivier/Desktop/'
]

{ #category : #draw }
PDFDemos class >> dottedTest [
	"drawing with dotted"
	
	"self dottedTest"
	
	| pdfdoc aPage |
	pdfdoc := PDFDocument new.	
	
	aPage := PDFPage new.
	
	aPage add: (PDFLineStyle new
		xy: 10@10;
		destination: 100@30;
		dotted: (PDFDotted new length: 2; space: 3)
	).
	
	aPage add: (PDFLineStyle new
		xy: 30@30;
		destination: 80@50;
		dotted: (PDFDotted new)
	).

	aPage add: (PDFLineStyle new
		xy: 10@10;
		destination: 10@50
	 ).
	
	aPage add: (PDFRectStyle new
		xy: 80@80;
		wh: 100@30; 
		dotted: (PDFDotted new length: 0.5; space: 0.5);
		thickness:  2
		).
			
	pdfdoc add: aPage.
	
	pdfdoc exportToFile: self demoPath  , 'dottedTest.pdf'.
]

{ #category : #text }
PDFDemos class >> euroTest [
	"a PDF document with the euro sign"

	"PDFDemos euroTest"
	| pdfdoc aPage theText|

       pdfdoc := PDFDocument new.

       aPage := PDFPage new.
	theText :=  ('Price: (24{1})A\B' format: { (128 asCharacter) asString} ).
	
       aPage add: (PDFTextStyle new xy: 50@10; text: theText; font: (PDFTimesFont new)).
       aPage add: (PDFTextStyle new xy: 50@20; text: theText; font: (PDFCourierFont new)).
       aPage add: (PDFTextStyle new xy: 50@30; text: theText; font: (PDFHelveticaFont  new)).

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

	aPage add: (PDFTextStyle new 
		xy: 10@10; 
		text: 'A grey level text'; 
		font: (PDFCourierFont new);
		ink: (PDFColor new setGreyLevel: 128)
		).
		
	aPage add: (PDFRectStyle new 
		xy: 10@20;
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
	aPage add: (PDFCellStyle new 
		font: myFont;
		text: 'Header and Footer test').

	pdfdoc add: aPage.

	secondPage := PDFPage new.
	secondPage add: (PDFCellStyle new 
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

{ #category : #document }
PDFDemos class >> multiOrientationsTest [
	"Create a document with two pages and two different orientations"
	
	"self multiOrientationsTest"
	
	| pdfdoc myBigFont firstPage secondPage myLandscapeFormat |
	pdfdoc := PDFDocument new.	

	myLandscapeFormat := PDFA3Format new setLandscape.
	
	myBigFont := PDFTimesFont new fontSize: 16.
	
	firstPage := PDFPage new.	
	firstPage add: (PDFCellStyle new 
		font: myBigFont; 
		wh: 40@10; 
		text: 'Page 1').
	
	secondPage := PDFPage new format: myLandscapeFormat.
	
	secondPage add: (PDFCellStyle new 
		font: myBigFont; 
		wh: 40@10; 
		text: 'Page en A3').	
			
	pdfdoc add: firstPage.
	pdfdoc add: secondPage.

	pdfdoc exportToFile: self demoPath , 'multiOrientationsTest.pdf'.
]

{ #category : #highLevel }
PDFDemos class >> paragraphTest [
	"Use of paragraphs"
	
	"self paragraphTest"
	
	| pdfdoc aPage |
	pdfdoc := PDFDocument new.	
	
	aPage := PDFPage new.

	aPage add: (PDFParagraphStyle new 
		wh: 160@20; 
		border: true; 
		fillColor: (PDFColor new setGreyLevel: 220);
		text: '1 Emensis itaque difficultatibus multis et nive obrutis callibus plurimis ubi prope Rauracum ventum est ad supercilia fluminis Rheni, resistente multitudine Alamanna pontem suspendere navium conpage Romani vi nimia vetabantur ritu grandinis undique convolantibus telis, et cum id inpossibile videretur, imperator cogitationibus magnis attonitus, quid capesseret ambigebat.').

	aPage add: (PDFParagraphStyle new 
		xy: 20@40;
		wh: 60@60; 
		border: true; 
		text: '2 Quam ob rem ut ii qui superiores sunt submittere se debent in amicitia, sic quodam modo inferiores extollere. Sunt enim quidam qui molestas amicitias faciunt, cum ipsi se contemni putant; quod non fere contingit nisi iis qui etiam contemnendos se arbitrantur; qui hac opinione non modo verbis sed etiam opere levandi sunt.').

	aPage add: (PDFParagraphStyle new 
		xy: 100@40;
		wh: 60@70; 
		border: true; 
		text: '3 Denique Antiochensis ordinis vertices sub uno elogio iussit occidi ideo efferatus, quod ei celebrari vilitatem intempestivam urgenti, cum inpenderet inopia, gravius rationabili responderunt; et perissent ad unum ni comes orientis tunc Honoratus fixa constantia restitisset.';
		alignToCenter).
		
	aPage add: (PDFParagraphStyle new 
		xy: 10@120;
		wh: 60@80; 
		border: true; 
		text: '4 Igitur per multiplices dilatata fortunas cum ambigerentur quaedam, non nulla levius actitata constaret, post multorum clades Apollinares ambo pater et filius in exilium acti cum ad locum Crateras nomine pervenissent, villam scilicet suam quae ab Antiochia vicensimo et quarto disiungitur lapide, ut mandatum est, fractis cruribus occiduntur.';
		alignToTheRight
		).
		
	pdfdoc add: aPage.
	
	pdfdoc exportToFile: self demoPath , 'paragraph.pdf'.
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
		aPage add: (PDFLineStyle new xy: xy1; destination: xy2; thickness: i).
		xy1 := (xy1 x) @ (xy1 y + 10).
		xy2 := (xy2 x) @ (xy2 y + 10).
	].	
	
	aPage add: (PDFRectStyle new 
		xy: 50@80;
		wh: 50@50; 
		thickness:  5
		).
	
	pdfdoc add: aPage.
	
	pdfdoc exportToFile: self demoPath , 'thicknessTest.pdf'.

	
	
]

{ #category : #draw }
PDFDemos class >> twoRectsTest [
	"intersecting rects"
	
	"self twoRectsTest"
	
	| pdfdoc aPage |
	pdfdoc := PDFDocument new.	
	
	aPage := PDFPage new.
	
	aPage add: (PDFRectStyle new
		xy: 10@10;
		wh: 100@30 ).
	aPage add: (PDFRectStyle new
		xy: 15@15;
		wh: 100@30 ).		
	pdfdoc add: aPage.
	
	pdfdoc exportToFile: self demoPath  , 'twoRectTest.pdf'.
]

{ #category : #'as yet unclassified' }
PDFDemos class >> unCarresDansUnCarreStyle [
	"un test de style géométrique"
	
	"self unCarresDansUnCarreStyle"
	
	| pdfdoc aPage |
	pdfdoc := PDFDocument new.	
	
	aPage := PDFPage new.
	
	aPage add: (UnCarreDansUnCarre new
		xy: 10@10;
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
	
	aPage add: (PDFCellStyle new font: myFont; wh: width@10; border: true; linefeed: true; text: text).

	"aPage add: (PDFCellStyle new font: myBigFont; wh: 100@10; border: true; linefeed: true; text: text)."
	
	"Transcript show: pdfdoc margins asString."
	aPage add: (PDFLineStyle new xy: 10@60; destination: 110@60).
	pdfdoc add: aPage.
	
	pdfdoc exportToFile: self demoPath , 'widthTest.pdf'.

	
	
]
