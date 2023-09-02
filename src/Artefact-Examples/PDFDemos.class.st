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
	#category : #'Artefact-Examples-Demos'
}

{ #category : #templates }
PDFDemos class >> CDTemplateTest [
	"PDFDemos CDTemplateTest"

	<script>
	self
		streamNamed: 'CDTemplateTest.pdf'
		do: [ :s | self new CDTemplateTest: s ]
]

{ #category : #templates }
PDFDemos class >> DVDTemplateTest [
	"PDFDemos DVDTemplateTest"

	<script>
	self
		streamNamed: 'DVDTemplateTest.pdf'
		do: [ :s | self new DVDTemplateTest: s ]
]

{ #category : #text }
PDFDemos class >> alignmentsTest [
	"PDFDemos alignmentsTest"

	<script>
	self
		streamNamed: 'alignmentsTest.pdf'
		do: [ :s | self new alignmentsTest: s ]
]

{ #category : #composite }
PDFDemos class >> arrowTest [
	"PDFDemos arrowTest"

	<script>
	self
		streamNamed: 'arrowTest.pdf'
		do: [ :s | self new arrowTest: s ]
]

{ #category : #draw }
PDFDemos class >> bezierTest [
	"PDFDemos bezierTest"

	<script>
	self
		streamNamed: 'bezierTest.pdf'
		do: [ :s | self new bezierTest: s ]
]

{ #category : #experimental }
PDFDemos class >> brochureTest [
	"PDFDemos brochureTest"

	<script>
	self
		streamNamed: 'brochureTest.pdf'
		do: [ :s | self new brochureTest: s ]
]

{ #category : #draw }
PDFDemos class >> capLineTest [
	"PDFDemos capLineTest"

	<script>
	self
		streamNamed: 'capLineTest.pdf'
		do: [ :s | self new capLineTest: s ]
]

{ #category : #composite }
PDFDemos class >> cellTest [
	"PDFDemos cellTest"

	<script>
	self
		streamNamed: 'cellTest.pdf'
		do: [ :s | self new cellTest: s ]
]

{ #category : #draw }
PDFDemos class >> circlesTest [
	"PDFDemos circlesTest"

	<script>
	self
		streamNamed: 'circlesTest.pdf'
		do: [ :s | self new circlesTest: s ]
]

{ #category : #color }
PDFDemos class >> colorTest [
	"PDFDemos colorTest"

	<script>
	self
		streamNamed: 'colorTest.pdf'
		do: [ :s | self new colorTest: s ]
]

{ #category : #composite }
PDFDemos class >> datatableTest [
	"PDFDemos datatableTest"

	<script>
	self
		streamNamed: 'datatableTest.pdf'
		do: [ :s | self new datatableTest: s ]
]

{ #category : #composite }
PDFDemos class >> datatableWithCaptionsTest [
	"PDFDemos datatableWithCaptionsTest"

	<script>
	self
		streamNamed: 'datatableWithCaptionsTest.pdf'
		do: [ :s | self new datatableWithCaptionsTest: s ]
]

{ #category : #tool }
PDFDemos class >> demoPath [
	^ 'pdf/'
]

{ #category : #'display setup' }
PDFDemos class >> documentDisplayLayoutTest [
	"PDFDemos documentDisplayLayoutTest"

	<script>
	self
		streamNamed: 'documentDisplayLayoutTest.pdf'
		do: [ :s | self new documentDisplayLayoutTest: s ]
]

{ #category : #'display setup' }
PDFDemos class >> documentDisplayModeTest [
	"PDFDemos documentDisplayModeTest"

	<script>
	self
		streamNamed: 'documentDisplayModeTest.pdf'
		do: [ :s | self new documentDisplayModeTest: s ]
]

{ #category : #'display setup' }
PDFDemos class >> documentZoomTest [
	"PDFDemos documentZoomTest"

	<script>
	self
		streamNamed: 'documentZoomTest.pdf'
		do: [ :s | self new documentZoomTest: s ]
]

{ #category : #color }
PDFDemos class >> drawStyleSheetTest [
	"PDFDemos drawStyleSheetTest"

	<script>
	self
		streamNamed: 'drawStyleSheetTest.pdf'
		do: [ :s | self new drawStyleSheetTest: s ]
]

{ #category : #draw }
PDFDemos class >> ellipsesTest [
	"PDFDemos ellipsesTest"

	<script>
	self
		streamNamed: 'ellipsesTest.pdf'
		do: [ :s | self new ellipsesTest: s ]
]

{ #category : #text }
PDFDemos class >> euroTest [
	"PDFDemos euroTest"

	<script>
	self
		streamNamed: 'euroTest.pdf'
		do: [ :s | self new euroTest: s ]
]

{ #category : #color }
PDFDemos class >> greyLevelTest [
	"PDFDemos greyLevelTest"

	<script>
	self
		streamNamed: 'greyLevelTest.pdf'
		do: [ :s | self new greyLevelTest: s ]
]

{ #category : #layout }
PDFDemos class >> horizontalLayoutTest [
	"PDFDemos horizontalLayoutTest"

	<script>
	self
		streamNamed: 'horizontalLayoutTest.pdf'
		do: [ :s | self new horizontalLayoutTest: s ]
]

{ #category : #image }
PDFDemos class >> imageJPGTest [
	"PDFDemos imageJPGTest"

	<script>
	self
		streamNamed: 'imageJPGTest.pdf'
		do: [ :s | self new imageJPGTest: s ]
]

{ #category : #image }
PDFDemos class >> imagePNGTest [
	"PDFDemos imagePNGTest"

	<script>
	self
		streamNamed: 'imagePNGTest.pdf'
		do: [ :s | self new imagePNGTest: s ]
]

{ #category : #document }
PDFDemos class >> infosTest [
	"PDFDemos infosTest"

	<script>
	self
		streamNamed: 'infosTest.pdf'
		do: [ :s | self new infosTest: s ]
]

{ #category : #draw }
PDFDemos class >> lineTest [
	"PDFDemos lineTest"

	<script>
	self
		streamNamed: 'lineTest.pdf'
		do: [ :s | self new lineTest: s ]
]

{ #category : #color }
PDFDemos class >> mosaiqueTest [
	"PDFDemos mosaiqueTest"

	<script>
	self
		streamNamed: 'mosaiqueTest.pdf'
		do: [ :s | self new mosaiqueTest: s ]
]

{ #category : #document }
PDFDemos class >> multiOrientationsTest [
	"PDFDemos multiOrientationsTest"

	<script>
	self
		streamNamed: 'multiOrientationsTest.pdf'
		do: [ :s | self new multiOrientationsTest: s ]
]

{ #category : #style }
PDFDemos class >> multiStyleArrowsTest [
	"PDFDemos multiStyleArrowsTest"

	<script>
	self
		streamNamed: 'multiStyleArrowsTest.pdf'
		do: [ :s | self new multiStyleArrowsTest: s ]
]

{ #category : #cool }
PDFDemos class >> oneLineTest [
	"PDFDemos oneLineTest"

	<script>
	self
		streamNamed: 'oneLineTest.pdf'
		do: [ :s | self new oneLineTest: s ]
]

{ #category : #composite }
PDFDemos class >> paragraphTest [
	"PDFDemos paragraphTest"

	<script>
	self
		streamNamed: 'paragraphTest.pdf'
		do: [ :s | self new paragraphTest: s ]
]

{ #category : #composite }
PDFDemos class >> paragraphWithSpacingTest [
	"PDFDemos paragraphWithSpacingTest"

	<script>
	self
		streamNamed: 'paragraphWithSpacingTest.pdf'
		do: [ :s | self new paragraphWithSpacingTest: s ]
]

{ #category : #draw }
PDFDemos class >> polygonsTest [
	"PDFDemos polygonsTest"

	<script>
	self
		streamNamed: 'polygonsTest.pdf'
		do: [ :s | self new polygonsTest: s ]
]

{ #category : #draw }
PDFDemos class >> rectsTest [
	"PDFDemos rectsTest"

	<script>
	self
		streamNamed: 'rectsTest.pdf'
		do: [ :s | self new rectsTest: s ]
]

{ #category : #experimental }
PDFDemos class >> rotationTest [
	"PDFDemos rotationTest"

	<script>
	self
		streamNamed: 'rotationTest.pdf'
		do: [ :s | self new rotationTest: s ]
]

{ #category : #runAllDemos }
PDFDemos class >> runAllDemos [
	"self runAllDemos"

	<script>
	PDFDemos class methods select: [:m | m selector endsWith: 'Test' ] thenDo: [ :m | PDFDemos perform: m selector ]
]

{ #category : #tool }
PDFDemos class >> streamNamed: aName do: aBlock [

	| file |
	file := (self demoPath , aName) asFileReference.
	file parent ensureCreateDirectory.
	file ensureDelete.

	^ file binaryWriteStreamDo: aBlock
]

{ #category : #text }
PDFDemos class >> textTest [
	"PDFDemos textTest"

	<script>
	self
		streamNamed: 'textTest.pdf'
		do: [ :s | self new textTest: s ]
]

{ #category : #draw }
PDFDemos class >> thicknessTest [
	"PDFDemos thicknessTest"

	<script>
	self
		streamNamed: 'thicknessTest.pdf'
		do: [ :s | self new thicknessTest: s ]
]

{ #category : #draw }
PDFDemos class >> twoColoredRectsOpacityTest [
	"PDFDemos twoColoredRectsOpacityTest"

	<script>
	self
		streamNamed: 'twoColoredRectsOpacityTest.pdf'
		do: [ :s | self new twoColoredRectsOpacityTest: s ]
]

{ #category : #draw }
PDFDemos class >> twoColoredRectsTest [
	"PDFDemos twoColoredRectsTest"

	<script>
	self
		streamNamed: 'twoColoredRectsTest.pdf'
		do: [ :s | self new twoColoredRectsTest: s ]
]

{ #category : #layout }
PDFDemos class >> verticalLayoutTest [
	"PDFDemos verticalLayoutTest"

	<script>
	self
		streamNamed: 'verticalLayoutTest.pdf'
		do: [ :s | self new verticalLayoutTest: s ]
]

{ #category : #misc }
PDFDemos class >> widthTest [
	"PDFDemos widthTest"

	<script>
	self
		streamNamed: 'widthTest.pdf'
		do: [ :s | self new widthTest: s ]
]

{ #category : #templates }
PDFDemos >> CDTemplateTest: aStream [
	| pdfdoc |
	pdfdoc := PDFDocument new.
	pdfdoc add: (PDFCompactDiscTemplate new format: PDFCompactDiscTemplate recommendedPageFormat).
	pdfdoc exportTo: aStream
]

{ #category : #templates }
PDFDemos >> DVDTemplateTest: aStream [
	| pdfdoc |
	pdfdoc := PDFDocument new.
	pdfdoc add: (PDFDVDCoverTemplate new format: (PDFCompactDiscTemplate recommendedPageFormat)).
pdfdoc exportTo: aStream
]

{ #category : #text }
PDFDemos >> alignmentsTest: aStream [
	"a simple demonstration of Artefact"

	| pdfdoc myFont aPage |
	pdfdoc := PDFDocument new.
	myFont := PDFHelveticaFont new fontSize: 16 pt.
	aPage := PDFPage new.
	aPage
		add:
			(PDFFormattedTextElement new
				font: myFont;
				dimension: 210 mm @ 10 mm;
				from: 0 mm @ 0 mm;
				text: 'At left').

		aPage
		add:
			(PDFFormattedTextElement new
				font: myFont;
				dimension: 210 mm @ 10 mm;
				from: 0 mm @ 20 mm;
				text: 'Center';
				alignment: (PDFAlignment center)).
					aPage
		add:
			(PDFFormattedTextElement new
				font: myFont;
				dimension: 210 mm @ 10 mm;
				from: 0 mm @ 30 mm;
				text: 'At right';
				alignment: (PDFAlignment right)).
	pdfdoc add: aPage.
	pdfdoc exportTo: aStream
]

{ #category : #composite }
PDFDemos >> arrowTest: aStream [
	"drawing arrows"

	| pdfdoc aPage |
	pdfdoc := PDFDocument new.
	aPage := PDFPage new.
	aPage
		add:
			((PDFArrowElement from: 10 mm @ 10 mm to:  100 mm @ 30 mm)
				drawColor: (PDFColor r: 255 g: 0 b: 0)).
	aPage
		add:
			(PDFArrowElement from: 10 mm @ 20 mm to:  30 mm @ 30 mm).
	aPage
		add:
			((PDFArrowElement from: 120 mm @ 10 mm to:  120 mm @ 40 mm)
				drawColor: (PDFColor r: 0 g: 0 b: 255)).
	aPage
		add:
			((PDFArrowElement from: 125 mm @ 40 mm to:  140 mm @ 40 mm)
				drawColor: (PDFColor r: 0 g: 0 b: 255)).
	aPage
		add:
			((PDFArrowElement from: 125 mm @ 40 mm to:  100 mm @ 80 mm)
				drawColor: (PDFColor r: 0 g: 255 b: 0);
				dotted:
						(PDFDotted new
								length: 2 mm;
								space: 3 mm)).
	aPage
		add:
			((PDFArrowElement from: 40 mm @ 50 mm to:  80 mm @ 90 mm)
				drawColor: (PDFColor r: 192 g: 255 b: 0);
				thickness: 2 mm;
				roundCap: true).
	aPage
		add:
			((PDFDoubleArrowElement from: 10 mm @ 80 mm to:  100 mm @ 150 mm)
				drawColor: (PDFColor r: 0 g: 128 b: 0);
				dotted:
						(PDFDotted new
								length: 2 mm;
								space: 2 mm)).
	pdfdoc add: aPage.
	pdfdoc exportTo: aStream
]

{ #category : #draw }
PDFDemos >> bezierTest: aStream [
	"drawing bezier curves"
	| pdfdoc aPage |
	pdfdoc := PDFDocument new.
	aPage := PDFPage new.

	aPage
		add:
				((PDFBezierCurveElement
						from: 10 mm @ 50 mm
						points:
							{(0 mm @ 0 mm).
							(100 mm @ 20 mm).
							(150 mm @ 0 mm).
							(50 mm @ 50 mm)})
		thickness: 5 mm);
		add:
				((PDFBezierCurveElement
						from: 10 mm @ 70 mm
						points:
							{(0 mm @ 0 mm).
							(100 mm @ 20 mm).
							(150 mm @ 0 mm).
							(50 mm @ 50 mm)})
		thickness: 2 mm).

	pdfdoc add: aPage.
	pdfdoc exportTo: aStream
]

{ #category : #experimental }
PDFDemos >> brochureTest: aStream [
	"Artefact use an JPG file"

	| pdfdoc aPage titleFont subtitleFont titleColor layout quoteFont pharoLogo |
	pharoLogo := ZnClient new
		url: 'http://forum.world.st/attachment/4659694/0/pharo6.jpeg';
		get.	"Downloading JPEG file from internet with Zinc"
	pdfdoc := PDFDocument new.
	titleColor := PDFColor r: 13 g: 100 b: 175.
	titleFont := PDFHelveticaFont new
		fontSize: 22 pt;
		bold: true.
	quoteFont := PDFHelveticaFont new
		fontSize: 8mm;
		bold: true;
		italic: true.
	subtitleFont := PDFHelveticaFont new
		fontSize: 16 pt;
		bold: true.
	aPage := PDFPage new.
	aPage
		add:
				(PDFTextElement new
						text: 'The Live Programming Environment';
						from: 60 mm @ 26 mm;
						dimension: 110 mm @ 80 mm;
						font: quoteFont);
		add:
				((PDFJpegElement fromStream: pharoLogo readStream)
						from: 15 mm @ 20 mm;
						dimension: 40 mm @ 40 mm).
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
				dimension: 180 mm @ 35 mm;
				text:
						'Pharo''s goal is to deliver a clean, innovative, free open-source Smalltalk environment. By providing a stable and small core system, excellent developer tools, and maintained releases, Pharo is an attractive platform to build and deploy mission critical Smalltalk applications. Pharo is MIT licensed and is steered by a board of benevolent dictators. The board makes final decisions if no consensus can be reached within the community. Pharo fosters a healthy ecosystem of both private and commercial contributors who advance and maintain the core system and its external packages.').
			(PDFFormattedTextElement new
				textColor: titleColor;
				font: subtitleFont;
				text: 'Why Pharo?').
			(PDFParagraphElement new
				dimension: 180 mm @ 35 mm;
				text:
						'Pharo is a fork from the Squeak open-source Smalltalk. We decided to start Pharo because as active Squeakers, and responsible for Squeak 3.9, we felt the need to reconsider choices made. We want to create a better Smalltalk and be free to enhance it without fear of backwards compatibility to Squeak. Deciding to start Pharo was not easy because we invested a lot in Squeak (some of us wrote several books on Squeak and in particular Squeak By Example) and we like the Squeak community, but this is really important for us to open a new space. We want Pharo to be an excellent Smalltalk concerned with software engineering practices. We also want Pharo to be agile and be able to evolve. We hope you will like it and help make it better.').
			(PDFFormattedTextElement new
				textColor: titleColor;
				font: subtitleFont;
				text: 'A word about changes').
			(PDFParagraphElement new
				dimension: 180 mm @ 35 mm;
				text:
						'There is an important aspect behind Pharo: we want to make sure that Pharo is not a copy of the past but really a reinvention of Smalltalk. Now big-bang approaches rarely succeed. We will really favor evolutionary and incremental changes. We want to be able to experiment with important new features or libraries. For example, we need a new file library but that''s unlikely to happen in a day. Evolution means that we accept mistakes, we are not aiming for the next perfect solution in one big step -- even if we would love it. We will favor small incremental changes but a multitude of them. We will pay attention to your submissions to improve the system.')}.
	layout from: 15 mm @ 80 mm.
	layout spacing: 1 cm.
	aPage add: layout.
	pdfdoc add: aPage.
	pdfdoc exportTo: aStream
]

{ #category : #draw }
PDFDemos >> capLineTest: aStream [
	"drawing simple lines with round cap"

	| pdfdoc aPage |
	pdfdoc := PDFDocument new.
	aPage := PDFPage new.
	aPage
		add:
			((PDFLineElement
				from: 20 mm @ 20 mm
				to: 100 mm @ 60 mm)
				thickness:  5 mm;
				drawColor: (PDFColor r: 100 g: 25 b: 100) ;
				roundCap: true).
	aPage
		add:
			((PDFLineElement
				from: 30 mm @ 40 mm
				to: 110 mm @ 80 mm)
				drawColor: (PDFColor r: 240 g: 80 b: 100) ;
				thickness:  5 mm).

	pdfdoc add: aPage.

pdfdoc exportTo: aStream
]

{ #category : #composite }
PDFDemos >> cellTest: aStream [
	"Demonstration of PDFCellElement"

	| pdfdoc myTitleFont aPage |
	pdfdoc := PDFDocument new.

	myTitleFont := (PDFTimesFont size: 24 pt) bold: true.

	aPage := PDFPage new.

	aPage add: (PDFCellElement new
		from: 10 mm @ 5 mm;
		dimension: 190 mm @ 10 mm;
		fillColor: (PDFColor new setGreyLevel: 224);
		text: 'Demonstration of PDFCellElement';
		font: myTitleFont;
		alignment: PDFAlignment center
	).

	"horizontal alignment"
	aPage add: (PDFCellElement new
		from: 10 mm @ 20 mm;
		dimension: 50 mm @ 10 mm;
		text: 'alignment: left';
		alignment: PDFAlignment left
	).

	aPage add: (PDFCellElement new
		from: 80 mm @ 20 mm;
		dimension: 50 mm @ 10 mm;
		text: 'alignment: center'
	 ).

	aPage add: (PDFCellElement new
		from: 150 mm @ 20 mm;
		dimension: 50 mm @ 10 mm;
		text: 'alignment: right';
		alignment: PDFAlignment right
	).

	"vertical alignment"
	aPage add: (PDFCellElement new
		from: 10 mm @ 40 mm;
		dimension: 50 mm @ 10 mm;
		text: 'vertical: top';
		alignment: PDFAlignment top left
	).

	aPage add: (PDFCellElement new
		from: 80 mm @ 40 mm;
		dimension: 50 mm @ 10 mm;
		text: 'vertical: middle';
		alignment: PDFAlignment center middle
	).

	aPage add: (PDFCellElement new
		from: 150 mm @ 40 mm;
		dimension: 50 mm @ 10 mm;
		text: 'vertical: bottom';
		alignment: PDFAlignment right bottom
	).

	"colors"
	aPage add: (PDFCellElement new
		from: 10 mm @ 60 mm ;
		dimension: 50 mm @ 10 mm;
		textColor: (PDFColor r: 0 g: 0 b: 255);
		drawColor: (PDFColor r: 255 g: 0 b: 0);
		text: 'text: blue border: red';
		alignment: PDFAlignment center middle
	).

	aPage add: (PDFCellElement new
		from: 80 mm @ 60 mm;
		dimension: 50 mm @ 10 mm;
		textColor: (PDFColor r: 0 g: 0 b: 255);
		fillColor: (PDFColor r: 0 g: 255 b: 0);
		text: 'background: green';
		alignment: PDFAlignment center middle
	).

	aPage add: (PDFCellElement new
		from: 150 mm @ 60 mm;
		dimension: 50 mm @ 10 mm;
		textColor: (PDFColor new setGreyLevel: 255);
		fillColor: (PDFColor new setGreyLevel: 128);
		dotted: (PDFDotted new length: 1 mm; space: 1 mm);
		text: 'grey level & dotted border';
		thickness: 0.2 mm;
		alignment: PDFAlignment center middle
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
	| pdfdoc aPage |
	pdfdoc := PDFDocument new.
	aPage := PDFPage new.
	aPage add: (PDFCircleElement center: 50 mm @ 50 mm radius: 30 mm).
	aPage
		add:
			((PDFCircleElement from: 90 mm @ 20 mm to: 150 mm @ 180 mm)
				fillColor: (PDFColor r: 0 g: 255 b: 0);
				drawColor: (PDFColor r: 255 g: 0 b: 0)).
	pdfdoc add: aPage.
	pdfdoc exportTo: aStream
]

{ #category : #color }
PDFDemos >> colorTest: aStream [
	"generate a sample document with colors"

	| pdfdoc aPage |
	pdfdoc := PDFDocument new.

	aPage := PDFPage new.
	aPage add: (PDFCellElement new
		font: (PDFTimesFont new fontSize: 32pt);
		from: 10mm@10mm;
		dimension: 100 mm @ 20 mm;
		text: 'Hello World!';
		textColor: (PDFColor r: 255 g: 0 b: 0);
		fillColor: (PDFColor r: 0 g: 255 b: 0)
		).
	aPage add: (PDFRectElement new
		from: 10 mm @ 50 mm;
		dimension: 50 mm @ 50 mm;
		thickness: 5pt;
		drawColor: (PDFColor r: 0 g: 0 b: 255);
		fillColor: (PDFColor r: 0 g: 255 b: 0)
		).

	pdfdoc add: aPage.

pdfdoc exportTo: aStream
]

{ #category : #datatable }
PDFDemos >> datatableTest: aStream [
	"generate a datatable"

	| pdfdoc aPage |

	pdfdoc := PDFDocument new.
	pdfdoc setFormat: PDFA4Format new.
	pdfdoc metaData title: 'Users report'.
	pdfdoc styleSheet > #datatable > #even fillColor: (PDFColor r: 75 g: 75 b: 230).

	aPage := PDFPage new.
	aPage add: (PDFDataTableElement new
		data: #(
			#('Smith' 'Peter' 'peter.smith@mail.org')
			#('Jones' 'Mickael' 'mickael.jones@epr.com')
			#('washington' 'robert' 'robert.washington@blif.com')
		);
		from: 10 mm @ 10 mm;
		dimension: 190 mm @ 50 mm;
		customizationBlock: [ :cell :x :y :data | x even ifTrue: [cell style: #even] ]
	).

	aPage add: (PDFDataTableElement new
		data: #(
			#('Smith' 'Peter' 'peter.smith@mail.org')
			#('Jones' 'Mickael' 'mickael.jones@epr.com')
			#('washington' 'robert' 'robert.washington@blif.com')
		);
		textColor:(PDFColor r: 0 g: 0 b: 255);
		fillColor: (PDFColor new setGreyLevel: 230);
		font: (PDFTimesFont new fontSize: 6 pt);
		dotted: (PDFDotted new length: 0.2mm; space: 0.2mm);
		from: 10 mm @ 60 mm;
		dimension: 190 mm @ 50 mm
	).

	pdfdoc add: aPage.

																																																									pdfdoc exportTo: aStream
]

{ #category : #datatable }
PDFDemos >> datatableWithCaptionsTest: aStream [
	"generate a datatable with captions"

	| pdfdoc aPage |
	pdfdoc := PDFDocument new.
	pdfdoc styleSheet > #dataTableWithColoredCaption > #caption
		fillColor: (PDFColor r: 158 g: 158 b: 79);
		drawColor: (PDFColor r: 158 g: 158 b: 79).
	pdfdoc styleSheet > #dataTableWithColoredCaption margin: 4 pt.
	pdfdoc styleSheet > #dataTableWithColoredCaption > #cell alignment: PDFAlignment right.
	pdfdoc setFormat: PDFA4Format new.
	pdfdoc metaData title: 'Users report'.
	aPage := PDFPage new.
	aPage
		add:
			(PDFDataTableWithColumnsCaptionElement new
				captions: #('Name' 'Surname' 'email');
				data:
						#(#('Smith' 'Peter' 'peter.smith@mail.org') #('Jones' 'Mickael' 'mickael.jones@epr.com') #('washington' 'robert' 'robert.washington@blif.com'));
				from: 10 mm @ 20 mm;
				dimension: 190 mm @ 60 mm;
				style: #dataTableWithColoredCaption;
				yourself).
	aPage
		add:
			(PDFDataTableWithRowsCaptionElement new
				captions: #('Name' 'Surname' 'email');
				data:
						#(#('Smith' 'Jones' 'washington') #('Peter' 'Mickael' 'robert') #('peter.smith@mail.org' 'mickael.jones@epr.com' 'robert.washington@blif.com'));
				from: 10 mm @ 90 mm;
				dimension: 190 mm @ 60 mm).
	pdfdoc add: aPage.
	pdfdoc exportTo: aStream
]

{ #category : #'display setup' }
PDFDemos >> documentDisplayLayoutTest: aStream [
	"Configuration of display layout: singlePage, twoPages or continuousPages"

	| pdfdoc aPage1 aPage2 |
	pdfdoc := PDFDocument new twoPages.
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

	| pdfdoc aPage1 aPage2 |
	pdfdoc := PDFDocument new fullPage.
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

	| pdfdoc aPage1 aPage2 |
	pdfdoc := PDFDocument new zoom: 400. "set the zoom at 400%"
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

	| pdfdoc aPage |
	pdfdoc := PDFDocument new.

	aPage := PDFPage new.

	aPage add: (PDFRectElement new
		from: 10 mm @ 50 mm;
		dimension: 50 mm @ 50 mm;
		thickness: 5 mm;
		drawColor: (PDFColor r: 0 g: 0 b: 255);
		fillColor: (PDFColor r: 0 g: 255 b: 0)
		).

	aPage add: (PDFRectElement new
		from: 50 mm @ 60 mm;
		dimension: 50 mm @ 50 mm).

	pdfdoc add: aPage.

pdfdoc exportTo: aStream
]

{ #category : #draw }
PDFDemos >> ellipsesTest: aStream [
	"drawing circles"
	| pdfdoc aPage |
	pdfdoc := PDFDocument new.
	aPage := PDFPage new.
	aPage add: (PDFEllipseElement center: 50 mm @ 50 mm radius: 30 mm). "a circle"
	aPage
		add:
			((PDFEllipseElement from: 90 mm @ 20 mm to: 150 mm @ 180 mm)
				fillColor: (PDFColor r: 0 g: 255 b: 0);
				drawColor: (PDFColor r: 255 g: 0 b: 0)).
	pdfdoc add: aPage.
	pdfdoc exportTo: aStream
]

{ #category : #text }
PDFDemos >> euroTest: aStream [
	"a PDF document with the euro sign"

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

	| pdfdoc aPage |
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
		dimension: 50 mm @ 50 mm;
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
								dimension: 190 mm @ 10 mm;
								fillColor: (PDFColor new setGreyLevel: 224);
								text: 'Horizontal Layout';
								font: myTitleFont;
								alignment: PDFAlignment center);
				add:
						(PDFCellElement new
								from: 10 mm @ 20 mm;
								dimension: 50 mm @ 10 mm;
								text: 'alignment: left';
								alignment: PDFAlignment left);
				add:
						(PDFCellElement new
								from: 80 mm @ 20 mm;
								dimension: 50 mm @ 10 mm;
								text: 'alignment: center');
				add:
						(PDFCellElement new
								from: 150 mm @ 20 mm;
								dimension: 50 mm @ 10 mm;
								text: 'alignment: right';
								alignment: PDFAlignment right);
				add:
						(PDFCellElement new
								from: 10 mm @ 40 mm;
								dimension: 50 mm @ 10 mm;
								text: 'vertical: top';
								alignment: PDFAlignment left top);
				add:
						(PDFCellElement new
								from: 80 mm @ 40 mm;
								dimension: 50 mm @ 10 mm;
								text: 'vertical: middle';
								alignment: PDFAlignment center middle);
				add:
						(PDFCellElement new
								from: 150 mm @ 40 mm;
								dimension: 50 mm @ 10 mm;
								text: 'vertical: bottom';
								alignment: PDFAlignment right bottom);
				add:
						(PDFCellElement new
								from: 10 mm @ 60 mm;
								dimension: 50 mm @ 10 mm;
								textColor: (PDFColor r: 0 g: 0 b: 255);
								drawColor: (PDFColor r: 255 g: 0 b: 0);
								text: 'text: blue border: red';
								alignment: PDFAlignment center middle);
				add:
						(PDFCellElement new
								from: 80 mm @ 60 mm;
								dimension: 50 mm @ 10 mm;
								textColor: (PDFColor r: 0 g: 0 b: 255);
								fillColor: (PDFColor r: 0 g: 255 b: 0);
								text: 'background: green';
								alignment: PDFAlignment center middle);
				add:
						(PDFCellElement new
								from: 150 mm @ 60 mm;
								dimension: 50 mm @ 10 mm;
								textColor: (PDFColor new setGreyLevel: 255);
								fillColor: (PDFColor new setGreyLevel: 128);
								dotted:
										(PDFDotted new
												length: 1 mm;
												space: 1 mm);
								text: 'grey level & dotted border';
								thickness: 0.2 mm;
								alignment: PDFAlignment center middle);
				add:
						(PDFCellElement new
								from: 10 mm @ 80 mm;
								text: 'A cell without wh');
				add:
						(PDFCellElement new
								dimension: 50 mm @ 10 mm;
								text: 'A cell without xy')).
	pdfdoc add: aPage.
pdfdoc exportTo: aStream
]

{ #category : #image }
PDFDemos >> imageJPGTest: aStream [
	"How to use a JPEG file with artefact"

	| pdfdoc aPage pharoByExampleLogo |
	pdfdoc := PDFDocument new.
	"Downloading JPEG file from internet with Zinc"
	pharoByExampleLogo := (ZnClient new
		url: 'https://files.pharo.org/media/pharocard.jpg';
		get).
	aPage := PDFPage new.
	aPage add: (PDFJpegElement from: 5 mm@0mm dimension: 160mm@90mm fromStream: pharoByExampleLogo readStream).
	aPage
		add:
			((PDFJpegElement
				fromStream: pharoByExampleLogo readStream)
				from: 40 mm @ 100 mm;
				dimension: 40 mm  @ 40 mm;
				rotation: 10
				).
	aPage
		add:
			((PDFJpegElement
				fromStream: pharoByExampleLogo readStream)
				from: 40 mm @ 180 mm;
				dimension: 40 mm  @ 40 mm;
				rotation: 30
				).

	pdfdoc add: aPage.
pdfdoc exportTo: aStream
]

{ #category : #image }
PDFDemos >> imagePNGTest: aStream [
	"How to use a PNG file with artefact"

	| pdfdoc aPage pharoLogo |
	pdfdoc := PDFDocument new.
	"Downloading PNG file from internet with Zinc"
	pharoLogo := (ZnClient new
		url: 'http://pharo.org/files/pharo.png';
		get).
	aPage := PDFPage new.
	aPage add: (PDFPngElement from: 5 mm@0mm dimension: 160mm@90mm fromStream: pharoLogo readStream).

	pdfdoc add: aPage.
pdfdoc exportTo: aStream
]

{ #category : #document }
PDFDemos >> infosTest: aStream [
	"generate a sample document with informations"

	| pdfdoc aPage |
	pdfdoc := PDFDocument new.

	pdfdoc metaData title: 'Document title';
		subject: 'subject of the document';
		author: 'The Pasta Team';
		keywords: 'cool rock best';
		creator: 'Artefact - Pharo'.

	aPage := PDFPage new.

	pdfdoc add: aPage.

pdfdoc exportTo: aStream
]

{ #category : #draw }
PDFDemos >> lineTest: aStream [
	"drawing with simple lines around the page"

	| pdfdoc aPage |
	pdfdoc := PDFDocument new.
	aPage := PDFPage new.

	aPage
		add:
			(PDFLineElement
				from: 0 mm @ 0 mm
				to: 210 mm @ 0 mm).
	aPage
		add:
			(PDFLineElement
				from: 0 mm @ 0 mm
				to: 0 mm @ 297 mm).
	aPage
		add:
			(PDFLineElement
				from: 0 mm @ 297 mm
				to: 210 mm @ 297 mm).
	aPage
		add:
			(PDFLineElement
				from: 0 mm @ 0 mm
				to: 210 mm @ 297 mm).

	aPage add: (PDFLineElement from: 210mm@297mm to: 210mm@0mm).
	aPage add: (PDFLineElement from: 210mm@0mm to: 0mm@297mm).

	pdfdoc add: aPage.
	pdfdoc styleSheet drawColor: (PDFColor r: 200 g: 25 b: 25).
pdfdoc exportTo: aStream
]

{ #category : #color }
PDFDemos >> mosaiqueTest: aStream [
	"generate a sample document with colored squares"

	| tileSize plage pdfdoc aPage |
	pdfdoc := PDFDocument new.
	tileSize:= 5mm@5mm.
	plage := 0 to: 255.
	aPage := PDFPage new.
	pdfdoc add: aPage.
	0 to: (aPage format width convertTo: tileSize x unit) / tileSize x do: [ :x |
		0 to: (aPage format height convertTo: tileSize y unit) / tileSize y do: [ :y |
			aPage
				add:
					((PDFRectElement from: (x * tileSize x) @ (y * tileSize y) dimension: tileSize)
						fillColor: (PDFColor r: plage atRandom g: plage atRandom b: plage atRandom)) ] ].
	pdfdoc exportTo: aStream
]

{ #category : #document }
PDFDemos >> multiOrientationsTest: aStream [
	"Create a document with two pages and two different orientations"

	| pdfdoc myBigFont firstPage secondPage myLandscapeFormat |
	pdfdoc := PDFDocument new.

	myLandscapeFormat := PDFA3Format new setLandscape.

	myBigFont := PDFTimesFont new fontSize: 16 pt.

	firstPage := PDFPage new.
	firstPage add: (PDFCellElement new
		from: 10mm@10mm;
		font: myBigFont;
		dimension: 40 mm @ 10 mm;
		text: 'Page 1').

	secondPage := PDFPage new format: myLandscapeFormat.

	secondPage add: (PDFCellElement new
		from: 10mm@10mm;
		font: myBigFont;
		dimension: 40 mm @ 10 mm;
		text: 'Page en A3').

	pdfdoc add: firstPage.
	pdfdoc add: secondPage.

pdfdoc exportTo: aStream
]

{ #category : #style }
PDFDemos >> multiStyleArrowsTest: aStream [
	"drawing arrows with differents styles"

	| pdfdoc aPage |
	pdfdoc := PDFDocument new.
	pdfdoc styleSheet > #redArrow at: #drawColor put: (PDFColor r: 243 g: 24 b: 24).
	pdfdoc styleSheet	at: #drawColor put: (PDFColor r: 24 g: 24 b: 180).
	pdfdoc styleSheet > #greenArrow at: #drawColor put: (PDFColor r: 24 g: 180 b: 24).
	pdfdoc styleSheet > #greenArrow > #head at: #drawColor put: (PDFColor r: 255 g: 0 b: 0).
	aPage := PDFPage new.

	aPage add: ((PDFArrowElement
		from: 10 mm @ 10 mm
		to: 100 mm @30 mm)
		style: #redArrow
	).

	aPage add: (PDFArrowElement
		from: 10 mm @20 mm
		to: 30 mm @30 mm
	).

	aPage add: ((PDFArrowElement
		from: 10 mm @ 15 mm
		to: 70 mm @30 mm)
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

	| pdfdoc aPage |
	pdfdoc := PDFDocument new.

	aPage := PDFPage new.

	aPage add: (PDFParagraphElement new
		from: 90 mm @ 40 mm;
		dimension: 100 mm @ 20 mm;
		text: '1 Emensis itaque difficultatibus multis et nive obrutis callibus plurimis ubi prope Rauracum ventum est ad supercilia fluminis Rheni, resistente multitudine Alamanna pontem suspendere navium conpage Romani vi nimia vetabantur ritu grandinis undique convolantibus telis, et cum id inpossibile videretur, imperator cogitationibus magnis attonitus, quid capesseret ambigebat.').

	aPage add: (PDFParagraphElement new
		from: 20 mm @ 40 mm;
		dimension: 60 mm @ 60 mm;
		text: '2 Quam ob rem ut ii qui superiores sunt submittere se debent in amicitia, sic quodam modo inferiores extollere. Sunt enim quidam qui molestas amicitias faciunt, cum ipsi se contemni putant; quod non fere contingit nisi iis qui etiam contemnendos se arbitrantur; qui hac opinione non modo verbis sed etiam opere levandi sunt.').

	aPage add: (PDFParagraphElement new
		from: 100 mm @ 80 mm;
		dimension: 60 mm @ 70 mm;
		text: '3 Denique Antiochensis ordinis vertices sub uno elogio iussit occidi ideo efferatus, quod ei celebrari vilitatem intempestivam urgenti, cum inpenderet inopia, gravius rationabili responderunt; et perissent ad unum ni comes orientis tunc Honoratus fixa constantia restitisset.';
		alignment: PDFAlignment center).

	aPage add: (PDFParagraphElement new
		from: 10 mm @ 120 mm;
		dimension: 60 mm @ 80 mm;
		text: '4 Igitur per multiplices dilatata fortunas cum ambigerentur quaedam, non nulla levius actitata constaret, post multorum clades Apollinares ambo pater et filius in exilium acti cum ad locum Crateras nomine pervenissent, villam scilicet suam quae ab Antiochia vicensimo et quarto disiungitur lapide, ut mandatum est, fractis cruribus occiduntur.';
		alignment: PDFAlignment right
		).

	pdfdoc add: aPage.

pdfdoc exportTo: aStream
]

{ #category : #composite }
PDFDemos >> paragraphWithSpacingTest: aStream [
	"Use of paragraphs"

	| pdfdoc aPage |
	pdfdoc := PDFDocument new.

	aPage := PDFPage new.

	aPage add: (PDFParagraphElement new
		from: 90 mm @ 40 mm;
		dimension: 100 mm @ 20 mm;
		text: '1 Emensis itaque difficultatibus multis et nive obrutis callibus plurimis ubi prope Rauracum ventum est ad supercilia fluminis Rheni, resistente multitudine Alamanna pontem suspendere navium conpage Romani vi nimia vetabantur ritu grandinis undique convolantibus telis, et cum id inpossibile videretur, imperator cogitationibus magnis attonitus, quid capesseret ambigebat.').

	aPage add: (PDFParagraphElement new
		from: 20 mm @ 40 mm;
		dimension: 60 mm @ 60 mm;
		spacing: 0.5mm;
		text: '2 Quam ob rem ut ii qui superiores sunt submittere se debent in amicitia, sic quodam modo inferiores extollere. Sunt enim quidam qui molestas amicitias faciunt, cum ipsi se contemni putant; quod non fere contingit nisi iis qui etiam contemnendos se arbitrantur; qui hac opinione non modo verbis sed etiam opere levandi sunt.').

	aPage add: (PDFParagraphElement new
		from: 100 mm @ 80 mm;
		dimension: 60 mm @ 70 mm;
		spacing: 1mm;
		text: '3 Denique Antiochensis ordinis vertices sub uno elogio iussit occidi ideo efferatus, quod ei celebrari vilitatem intempestivam urgenti, cum inpenderet inopia, gravius rationabili responderunt; et perissent ad unum ni comes orientis tunc Honoratus fixa constantia restitisset.';
		alignment: PDFAlignment center).

	aPage add: (PDFParagraphElement new
		from: 10 mm @ 120 mm;
		dimension: 60 mm @ 80 mm;
		spacing: 3 mm;
		text: '4 Igitur per multiplices dilatata fortunas cum ambigerentur quaedam, non nulla levius actitata constaret, post multorum clades Apollinares ambo pater et filius in exilium acti cum ad locum Crateras nomine pervenissent, villam scilicet suam quae ab Antiochia vicensimo et quarto disiungitur lapide, ut mandatum est, fractis cruribus occiduntur.';
		alignment: PDFAlignment right
		).

	pdfdoc add: aPage.

pdfdoc exportTo: aStream
]

{ #category : #draw }
PDFDemos >> polygonsTest: aStream [
	"drawing polygons"
	| pdfdoc aPage |
	pdfdoc := PDFDocument new.
	aPage := PDFPage new.
	aPage
		add:
			((PDFPolygonElement
				from: 10 mm @ 10 mm
				points:
					{(0 mm @ 0 mm).
					(60 mm @ 20 mm).
					(50 mm @ 40 mm).
					(30 mm @ 50 mm).
					(15 mm @ 45 mm)}) drawColor: (PDFColor r: 0 g: 0 b: 255)).
	aPage
		add:
			((PDFPolygonElement
				from: 10 mm @ 65 mm
				points:
					{(0 mm @ 0 mm).
					(60 mm @ 60 mm).
					(50 mm @ 100 mm).
					(30 mm @ 110 mm).
					(15 mm @ 105 mm)})
				drawColor: (PDFColor r: 0 g: 0 b: 255);
				fillColor: (PDFColor r: 255 g: 0 b: 0);
				thickness: 5 mm;
				roundCap: true).
	pdfdoc add: aPage.
	pdfdoc exportTo: aStream
]

{ #category : #draw }
PDFDemos >> rectsTest: aStream [
	"intersecting rects"

	| pdfdoc aPage |
	pdfdoc := PDFDocument new.

	aPage := PDFPage new.

	aPage add: (PDFRectElement from: 0 mm @ 0 mm dimension: 210 mm @ 297 mm).

	aPage add: (PDFRectElement new
		from: 10 mm @ 10 mm;
		dimension: 100 mm @ 30 mm).
	aPage add: (PDFRectElement new
		from: 15 mm @ 15 mm;
		dimension: 100 mm @ 30 mm;
		fillColor: (PDFColor r: 142 g: 24 b: 78)
		).
	aPage add: (PDFRectElement new
		from: 20 mm @ 20 mm;
		dimension: 100 mm @ 30 mm;
		drawColor: (PDFColor r: 0 g: 255 b: 0)
		).
	pdfdoc add: aPage.

pdfdoc exportTo: aStream
]

{ #category : #experimental }
PDFDemos >> rotationTest: aStream [
	"PDFDemos rotationTest"

	| pdfdoc aPage  |
	pdfdoc := PDFDocument new compression: false.

	aPage := PDFPage new.
	aPage add: (PDFTextElement from: 10 mm @ 10 mm text: 'A very simple text').

	0 to: 35do: [ :a |
		aPage add: (PDFTextElement new from: 50 mm @ 50 mm; text: ('Rotated text with ' , (a * 10) asString); rotation: (a * 10)).
	].

	aPage add: (PDFTextElement from: 10 mm @ 50 mm text: 'A very simple text').
	pdfdoc  add: aPage.
	pdfdoc exportTo: aStream
]

{ #category : #text }
PDFDemos >> textTest: aStream [
	"PDFDemos textTest"

	| pdfdoc myFont aPage myFontInMilliMeters |
	pdfdoc := PDFDocument new.
	myFont := PDFTimesFont size: 24 pt.
	myFontInMilliMeters := PDFTimesFont size: 5 mm.
	aPage := PDFPage new.
	aPage
		add:
				(PDFTextElement from: 10 mm @ 10 mm text: 'A very simple text');
		add:
				(PDFTextElement new
						font: myFont;
						from: 10 mm @ 30 mm;
						text: 'A very simple text with specified font');
		add:
				(PDFTextElement new
						textColor: (PDFColor r: 255 g: 0 b: 0);
						from: 10 mm @ 50 mm;
						text: 'A very simple text with specified color');
		add:
				(PDFTextElement new
						textColor: (PDFColor r: 0 g: 0 b: 255);
						font: myFont;
						from: 10 mm @ 70 mm;
						text: 'A very simple text with specified color and font');
		add:
				(PDFTextElement new
						textColor: (PDFColor r: 0 g: 128 b: 255);
						font: myFontInMilliMeters;
						from: 10 mm @ 85 mm;
						text: 'A text with font expressed in mm (5)');
		add:
				(PDFLineElement
						from: 10 mm @ 85 mm
						to: 160 mm @ 85 mm);
		add:
				(PDFLineElement
						from: 10 mm @ 90 mm
						to: 160 mm @ 90 mm).
	pdfdoc add: aPage.
pdfdoc exportTo: aStream
]

{ #category : #draw }
PDFDemos >> thicknessTest: aStream [
	"generate a sample document for testing the draw objects"

	| pdfdoc aPage xy1 xy2 |

	pdfdoc := PDFDocument new.
	aPage := PDFPage new.
	xy1 := 10 mm @ 20 mm.
	xy2 := 100 mm@ 20 mm.

	1 to: 5 do: [ :i |
		aPage add: ((PDFLineElement from: xy1 to: xy2) thickness: i mm).
		xy1 := (xy1 x) @ (xy1 y + 10 mm).
		xy2 := (xy2 x) @ (xy2 y + 10 mm).
	].

	aPage add: ((PDFRectElement
		from: 50 mm @ 80 mm
		dimension: 50 mm @ 50 mm)
		thickness:  5 mm
		).

	pdfdoc add: aPage.

	pdfdoc exportTo: aStream
]

{ #category : #draw }
PDFDemos >> twoColoredRectsOpacityTest: aStream [
	"intersecting rects with opacity control"

	| pdfdoc aPage |
	pdfdoc := PDFDocument new uncompressed.

	aPage := PDFPage new.

	aPage add: (PDFRectElement new
		from: 10 mm @ 10 mm;
		dimension: 100 mm @ 30 mm;
		fillColor: (PDFColor r: 142 g: 24 b: 78);
		drawColor: (PDFColor r: 255 g: 0 b: 0);
		opacity: (PDFOpacityNormal alpha: 0.6)).
	aPage add: ((PDFTextElement from: 10 mm @ 10 mm text: 'A very simple text') opacity:  (PDFOpacityNormal alpha: 0.5)).
	aPage add: (PDFRectElement new
		from: 15 mm @ 15 mm;
		dimension: 100 mm @30 mm;
		fillColor: (PDFColor r: 24 g: 57 b: 205);
		drawColor: (PDFColor r: 0 g: 255 b: 0);
		opacity: (PDFOpacityColorBurn alpha: 0.3)).
	pdfdoc add: aPage.

pdfdoc exportTo: aStream
]

{ #category : #draw }
PDFDemos >> twoColoredRectsTest: aStream [
	"intersecting rects"

	| pdfdoc aPage |
	pdfdoc := PDFDocument new.

	aPage := PDFPage new.

	aPage add: (PDFRectElement new
		from: 10 mm @ 10 mm;
		dimension: 100 mm @ 30 mm;
		fillColor: (PDFColor r: 142 g: 24 b: 78);
		drawColor: (PDFColor r: 255 g: 0 b: 0)).
	aPage add: (PDFRectElement new
		from: 15 mm @ 15 mm;
		dimension: 100 mm @30 mm;
		fillColor: (PDFColor r: 24 g: 57 b: 205);
		drawColor: (PDFColor r: 0 g: 255 b: 0)).
	pdfdoc add: aPage.

pdfdoc exportTo: aStream
]

{ #category : #layout }
PDFDemos >> verticalLayoutTest: aStream [
	"self verticalLayoutTest"

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
								dimension: 190 mm @ 10 mm;
								fillColor: (PDFColor new setGreyLevel: 224);
								text: 'Demonstration of PDFCellStyle';
								font: myTitleFont;
								alignment: PDFAlignment center);
				add:
						(PDFCellElement new
								from: 10 mm @ 20 mm;
								dimension: 50 mm @ 10 mm;
								text: 'alignment: left';
								alignment: PDFAlignment left);
				add:
						(PDFCellElement new
								from: 80 mm @ 20 mm;
								dimension: 50 mm @ 10 mm;
								text: 'alignment: center');
				add:
						(PDFCellElement new
								from: 150 mm @ 20 mm;
								dimension: 50 mm @ 10 mm;
								text: 'alignment: right';
								alignment: PDFAlignment right);
				add:
						(PDFCellElement new
								from: 10 mm @ 40 mm;
								dimension: 50 mm @ 10 mm;
								text: 'vertical: top';
								alignment: PDFAlignment left top);
				add:
						(PDFCellElement new
								from: 80 mm @ 40 mm;
								dimension: 50 mm @ 10 mm;
								text: 'vertical: middle';
								alignment: PDFAlignment center middle);
				add:
						(PDFCellElement new
								from: 150 mm @ 40 mm;
								dimension: 50 mm @ 10 mm;
								text: 'vertical: bottom';
								alignment: PDFAlignment right bottom);
				add:
						(PDFCellElement new
								from: 10 mm @ 60 mm;
								dimension: 50 mm @ 10 mm;
								textColor: (PDFColor r: 0 g: 0 b: 255);
								drawColor: (PDFColor r: 255 g: 0 b: 0);
								text: 'text: blue border: red';
								alignment: PDFAlignment center middle);
				add:
						(PDFCellElement new
								from: 80 mm @ 60 mm;
								dimension: 50 mm @ 10 mm;
								textColor: (PDFColor r: 0 g: 0 b: 255);
								fillColor: (PDFColor r: 0 g: 255 b: 0);
								text: 'background: green';
								alignment: PDFAlignment center middle);
				add:
						(PDFCellElement new
								from: 150 mm @ 60 mm;
								dimension: 50 mm @ 10 mm;
								textColor: (PDFColor new setGreyLevel: 255);
								fillColor: (PDFColor new setGreyLevel: 128);
								dotted:
										(PDFDotted new
												length: 1 mm;
												space: 1 mm);
								text: 'grey level & dotted border';
								thickness: 0.2 mm;
								alignment: PDFAlignment center middle);
				add:
						(PDFCellElement new
								from: 10 mm @ 80 mm;
								text: 'A cell without wh');
				add:
						(PDFCellElement new
								dimension: 50 mm @ 10 mm;
								text: 'A cell without xy')).
	pdfdoc add: aPage.
pdfdoc exportTo: aStream
]

{ #category : #misc }
PDFDemos >> widthTest: aStream [
	"generate a sample document for testing the width of fonts"

	| pdfdoc aPage myFont myOtherFont width text |

	pdfdoc := PDFDocument new.

	myFont := PDFTimesFont new fontSize: 16 pt.
	text := 'Hello World !'.

	aPage := PDFPage new.

	width := myFont getStringWidth: text.
	aPage add: (PDFCellElement new from: 5mm@10mm; font: myFont; dimension: width@10mm; text: text).

	myOtherFont := PDFTimesFont new.
	myOtherFont fontSize: (myOtherFont getIdealFontSizeForTheString: text width: 10mm).
	aPage add: (PDFCellElement new from: 5mm@20mm; font: myOtherFont; dimension: 10mm@2mm; text: text).

	pdfdoc add: aPage.

	pdfdoc exportTo: aStream
]
