"
A PDFDocument is the basic brick in Artefact. It represents the whole document.

```Smalltalk
PDFDocument new add: (PDFPage new add: (PDFTextElement new text: 'HelloWorld'; from: 10mm@10mm)); exportTo: 'test.pdf' asFileReference writeStream
```

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
	#category : #'Artefact-Core-Base'
}

{ #category : #'instance creation' }
PDFDocument class >> element: anElement [

	^ self elements: { anElement }
]

{ #category : #'instance creation' }
PDFDocument class >> elements: aCollection [

	^ self new
		  addAll: aCollection;
		  yourself
]

{ #category : #action }
PDFDocument >> add: aPage [
	"Add a new page in the PDF document"

	self pages add: aPage.
	aPage document: self
]

{ #category : #action }
PDFDocument >> addAll: aCollection [

	aCollection do: [ :each | self add: each ]
]

{ #category : #configuration }
PDFDocument >> compressed [

	self compression: true
]

{ #category : #accessing }
PDFDocument >> compression [

	^ compression
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

	^ PDFA4Format new
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
	"Generate a PDFDataObject from document"

	^ PDFStreamPrinter new
		printModel: (PDFGenerator new generatePDFCompleteModelFrom: self)
		compression: self compression
		on: aStream
]

{ #category : #accessing }
PDFDocument >> format [

	^ format
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
	"Generate a PDFDataObject from document"

	^ PDFGenerator new generatePDFCompleteModelFrom: self
]

{ #category : #generate }
PDFDocument >> generateWith: aPDFGenerator on: aStream [
	aPDFGenerator generateDocument: aPDFGenerator on: aStream
]

{ #category : #accessing }
PDFDocument >> height [

	^ self format size y
]

{ #category : #initialization }
PDFDocument >> initialize [

	super initialize.
	self
		setFormat: self defaultFormat;
		styleSheet: StyleSheet default;
		metaData: PDFMetaData new;
		compression: true;
		defaultDisplayLayout;
		defaultDisplayMode
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

	self format: aFormat
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

	^ self format size x
]

{ #category : #accessing }
PDFDocument >> zoom [

	^ zoom
]

{ #category : #accessing }
PDFDocument >> zoom: anIntegerValue [

	zoom := anIntegerValue
]
