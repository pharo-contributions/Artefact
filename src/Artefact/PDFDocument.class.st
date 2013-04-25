"
! Introduction

ARTEFACT   

Artefact is a framework to generate PDF documents. There is fully written in Smalltalk and external libraries are not needed. There is light, platform independant and it's a tool with a high level of abstraction to easily creating PDF documents.  

 * written in Smalltalk (and only Smalltalk),
 * multi format document,
 * pages creation order could be totally different of the pages order in the PDF document,
 * ability to create multiple versions of a document,
 * page composition based on reusables PDF elements,
 * ability to define PDF code segments for inserting PDF instructions directly in the document (low level code),
 * PDF code optimization to produce compact files

Authors: Olivier Auverlot and Guillaume Larcheveque

! How to create my first PDF document ?
! Configuration of a PDF document
!! PDF metadata
!! Units of measurement
!! Document formats
!! Setting the position of items on a page
!! Selecting the display mode
! Controlling the pages
!! Creating and adding a page into a document
!! Setting the page format
!! Choosing the orientation
!! Using page templates
! The PDF elements
!! Apparences of PDF elements
!!! Playing with fonts
!!! Colors and grey levels
!!! The story of dots
!!! Using the stylesheet
!! Geometric shapes
!!! Lines
!!! Arrows
!!! Rectangles
!!! Polygons
!!! Circles
!!! Bezier curves
!! Texts
!!! Formatted texts
!!! Cells of text
!!! Paragraphs
!! Datatables
!!! Data table basic
!!! Datatable with captions
!!! Datatable customizable
! Creating PDF elements
! FAQ
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
	self styleSheet: (PDFStyleSheet defaultForDocument: self).
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

{ #category : #configuration }
PDFDocument >> noCompression [
	self compression: false
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
