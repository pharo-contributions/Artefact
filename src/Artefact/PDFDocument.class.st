"
ARTEFACT

an easy to use, extensible and cool framework to generate PDF

Authors: Olivier Auverlot and Guillaume Larcheveque aka The Pasta Team

PS: Titles are stupid but it was a hard work to express our pleasure to work together.

! Introduction: The PDF stays where it is, and the Artefact move the universe around it

Artefact is a framework to generate PDF documents. It is fully written in Smalltalk and doesn't require any native library. Artefact is light, platform independant and offer to users a high level of abstraction in order to easily creating PDF documents.  

 * completely written in Smalltalk (and only Smalltalk),
 * complete freedom about the order of creation for pages, elements... (no need to follow the document order)
 * multi format and orientation for pages
 * page composition based on reusables PDF elements,
 * extensibility by offering a composition standard to create your own high level elements
 * styleSheet that can be reused in many documents and avoid wasting time and place with duplication
 * image support with the JPEG format
 * pre-defined high level elements like datagrid
 * support PDF compression to produce compact files

! Your first PDF document (for dummies)
The best way to start with Artefact is to look at Artefact-Demos package and to run each PDFDemos class methods.

By default each generation result is written in the default pharo directory but you can define your own in the demoPath method 

example: 

	demoPath
		^ '/Users/pharo/pdf/'

If you want to run all demos, just execute: PDFDemos runAllDemos :-)

!Artefact global scheme, the cortex syndrom

The basic brick in Artefact is the PDFDocument which represent the whole document. In this PDFDocument you will add some PDFPage. A page is a drawing surface where you can put any PDFElement. Elements are the graphics object like texts, lines, arrows… Elements can be more complex as we will see in the PDFCompositeElement section. Every PDFElement can be included in a more complex composite elements and reused in many documents. We encourage you to create your own elements library and share it with other users.

Unlike many PDF frameworks, you don't have to create your pages in the order you want to print them. Moreover you can use the same page in many documents. Elements follow the same logical at the page level. 

Artefact use a tree structure to represent a document. It's important to understand that any property defined at a level will be applied at lower levels and will surcharge a higher one (example: if you define a format at the document level, it will be applied on all pages except the ones that define a specific format).

As you can see, Artefact is really easy to use:

	PDFDocument new add: (PDFPage new add: (PDFTextElement new text: 'Hello'; from: 10mm@10mm)); exportTo: 'test.pdf' asFileReference writeStream

!Positionning elements with the unprobability drive

Coordinates start from the upper left corner (0mm@0mm). As you can expect the x axis is the horizontal one and the y axis the vertical one. By convention, every PDFElement is positioned from his upper left corner.

As you probably noticed, Artefact use units like mm, pt... Every positions and size must be expressed with a unit and every unit can be used for anything (you can express font size with km if you want… but it's probably not a good idea! ). Thanks to the Units framework and its authors: http://smalltalkhub.com/#!/~MarcusDenker/Units

!Document, the world on top of four elephants

A PDFDocument is an ordered collection of pages. A document defines default values for pages and elements. By default, a document contains A4 portrait pages. You can change it with the format: method.

	PDFDocument new format: PDFA3Format new setLandscape.

A PDFDocument could be documented with metaData. All these data are contained in a PDFMetaData object which define following properties:
 * title
 * subject
 * author
 * keywords
 * creator
 * producer

	PDFDocument new metaData title: 'Document title'; 
		subject: 'subject of the document'; 
		author: 'The Pasta Team'; 
		keywords: 'cool rock best';
		creator: 'Artefact - Pharo'.

By default Artefact generate compressed document but you can disable and generate raw documents:

	PDFDocument new uncompressed

!Pages, no paper no trees (but lots of dead unicorns)

A page is included in a document (or more if you want to use it in many documents). By default, a page is in an A4 portrait format. You can change the format in the same way you does with document:

	PDFPage new format: PDFA3Format new setLandscape.

You can mix multiple formats and orientations in the same document.

Like painters and poets, an empty surface is just a base to expression. From this point of view, the most useful method of the PDFPage object is probably add: that allow you to write, draw or paint.

!Elements, a quill of ice and fire

A PDFElement is a reusable component that represent a text, an image, a geometric shape or even a complex graph or table.

There are two kinds of PDFElement:
 * Simple elements inherit from PDFBasic (primitive operation in the pdf specification)
 * Composite elements inherit from PDFComposite (a wrap between multiple PDFElements whether they are basic or composite)

Each PDFElement have a set of properties that define its appearance (text color, font, dots…). Those properties are grouped in a stylesheet owned by each element. Every element controls its own appearance and doesn't affect other (in opposition as many PDF framework that use a flow logic). This behavior allow you to move or even use in multiple pages or document the same element.

!Stylesheet, turn a frog into a prince without kissing

A PDFStyleSheet is a dictionary that map rendering properties. A default stylesheet is defined at the document level when this one is created. Consequently, you don't have to specify every values if you want a generic rendering. 
Following the hierarchy logic, a stylesheet defined at a lower level will surcharge properties. For example, if you define a textColor in the document stylesheet, every text will be written in that color except elements where textColor is define in their stylesheet. Like pages and elements, the same stylesheet can be used with different elements or documents.

Artefact introduce a style context. Every PDFElement can be associated to a specific style:

	PDFText from: 10mm@15mm text: 'My title' style: #title

Then, at any upper level (document, page…), you can express the specific title style context:

	myDocument stylesheet > #title at: #font put: PDFCourierFont size: 32 pt

!!Fonts
	
Artefact support integrated PDF fonts (PDFCourierFont, PDFHelveticaFont, PDFSymbolFont, PDFTimesFont and PDFZapfdingbatsFont). These fonts are available in any PDF viewer.
A PDFFont object supports the basic style: bold and italic.

	PDFText from: 10mm@15mm text: 'My title' font: ((PDFTimesFont size: 24 pt) bold: true).

!!Dots

All the geometric shapes can use a dotted style. It is defined by a PDFDotted object that specify the length of each segment and the space between them.

	((PDFArrowElement from: 125 mm @ 40 mm to:  100 mm @ 80 mm)
				drawColor: (PDFColor r: 0 g: 255 b: 0);
				dotted:
						(PDFDotted new
								length: 2 mm;
								space: 3 mm)).

"
Class {
	#name : #PDFDocument,
	#superclass : #Object,
	#instVars : [
		'metaData',
		'pages',
		'orientation',
		'format',
		'styleSheet',
		'zoom',
		'displayMode',
		'displayLayout',
		'version',
		'compression'
	],
	#category : #Artefact
}

{ #category : #'as yet unclassified' }
PDFDocument class >> FrameworkManual [
	<wikiStyleHelp: #'Artefact (PDF framework)'>
	^ self comment
]

{ #category : #action }
PDFDocument >> add: aPage [
	"add a new page in the PDF document"
	self pages add: aPage.
	aPage document: self

	
	

]

{ #category : #configuration }
PDFDocument >> compressed [
	self compression: true
]

{ #category : #accessing }
PDFDocument >> compression [
	^compression
]

{ #category : #accessing }
PDFDocument >> compression: aBoolean [ 	
	compression := aBoolean
]

{ #category : #displayLayout }
PDFDocument >> continuousPages [
	self displayLayout: #continuousPages
]

{ #category : #displayLayout }
PDFDocument >> defaultDisplayLayout [
	self displayLayout: #defaultDisplayLayout
]

{ #category : #displayMode }
PDFDocument >> defaultDisplayMode [
	self displayMode: #defaultDisplayMode.
	self zoom: nil
]

{ #category : #configuration }
PDFDocument >> defaultFormat [
	^PDFA4Format new
]

{ #category : #accessing }
PDFDocument >> displayLayout [
	^ displayLayout
]

{ #category : #accessing }
PDFDocument >> displayLayout: anObject [
	displayLayout := anObject
]

{ #category : #accessing }
PDFDocument >> displayMode [
	^ displayMode
]

{ #category : #accessing }
PDFDocument >> displayMode: anObject [
	displayMode := anObject
]

{ #category : #generate }
PDFDocument >> exportTo: aStream [
	"generate a PDFDataObject from document"

	^ PDFStreamPrinter new
		printModel: (PDFGenerator new generatePDFCompleteModelFrom: self)
		compression: self compression
		on: aStream
]

{ #category : #accessing }
PDFDocument >> format [
	^format
]

{ #category : #accessing }
PDFDocument >> format: aValue [
	format := aValue
]

{ #category : #displayMode }
PDFDocument >> fullPage [
	self displayMode: #fullPage.
	self zoom: nil
]

{ #category : #displayMode }
PDFDocument >> fullWidth [
	self displayMode: #fullWidth.
	self zoom: nil
]

{ #category : #generate }
PDFDocument >> generate [
	"generate a PDFDataObject from document"

	^ PDFGenerator new generatePDFCompleteModelFrom: self
]

{ #category : #generate }
PDFDocument >> generateWith: aPDFGenerator on: aStream [
	aPDFGenerator generateDocument: aPDFGenerator on: aStream
]

{ #category : #accessing }
PDFDocument >> height [
	^(self format size y)
]

{ #category : #'initialize-release' }
PDFDocument >> initialize [
	super initialize.

	self setFormat: self defaultFormat.
	self styleSheet: (PDFStyleSheet default).
	self metaData: PDFMetaData new.
	self compression: true.
	self defaultDisplayLayout.
	self defaultDisplayMode.
]

{ #category : #accessing }
PDFDocument >> metaData [
	^ metaData
]

{ #category : #accessing }
PDFDocument >> metaData: anObject [
	metaData := anObject
]

{ #category : #accessing }
PDFDocument >> orientation [
	^ orientation
]

{ #category : #accessing }
PDFDocument >> orientation: aValue [
	orientation := aValue
]

{ #category : #accessing }
PDFDocument >> pages [
	^ pages ifNil: [ pages := OrderedCollection new ]
]

{ #category : #accessing }
PDFDocument >> pages: aListOfPDFPage [
	pages := aListOfPDFPage
]

{ #category : #displayMode }
PDFDocument >> real [
	self displayMode: #real.
	self zoom: nil
]

{ #category : #'page setup' }
PDFDocument >> setFormat: aFormat [
	self format: aFormat.
]

{ #category : #displayLayout }
PDFDocument >> singlePage [
	self displayLayout: #singlePage
]

{ #category : #accessing }
PDFDocument >> styleSheet [
	^ styleSheet
]

{ #category : #accessing }
PDFDocument >> styleSheet: anObject [
	styleSheet := anObject
]

{ #category : #displayLayout }
PDFDocument >> twoPages [
	self displayLayout: #twoPages
]

{ #category : #configuration }
PDFDocument >> uncompressed [
	self compression: false
]

{ #category : #accessing }
PDFDocument >> width [
	^(self format size x)
]

{ #category : #accessing }
PDFDocument >> zoom [
	^zoom
]

{ #category : #accessing }
PDFDocument >> zoom: anIntegerValue [
	zoom := anIntegerValue
]
