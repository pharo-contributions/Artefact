Class {
	#name : #PDFDocument,
	#superclass : #Object,
	#instVars : [
		'document',
		'pages',
		'fonts',
		'orientation',
		'page',
		'format',
		'size',
		'margins',
		'scaleFactor',
		'autoPageBreak',
		'pageBreakTrigger'
	],
	#category : #Artefact
}

{ #category : #action }
PDFDocument >> add: aPage [
	"add a new page in the PDF document"
	(self page > 0) ifTrue: [
		self endPage. 
	].
	self beginPage.
	
	"Process the styles in the page"
	

]

{ #category : #accessing }
PDFDocument >> autoPageBreak [
	^autoPageBreak
]

{ #category : #accessing }
PDFDocument >> autoPageBreak: aLogicValue [
	autoPageBreak := aLogicValue
]

{ #category : #private }
PDFDocument >> beginPage [
	"Start a new page"
	self page: self page + 1.
	
]

{ #category : #accessing }
PDFDocument >> document [
	^ document ifNil: [ document := '%PDF-1.3' , (String cr) ]
]

{ #category : #accessing }
PDFDocument >> document: bodyOfPDFDocument [
	document := bodyOfPDFDocument
]

{ #category : #private }
PDFDocument >> endPage [
	"Close a page"
]

{ #category : #accessing }
PDFDocument >> fonts [
	^ fonts ifNil: [ 
		fonts := #(
			'courier'->'Courier' , 'courierB'->'Courier-Bold' , 'courierI' -> 'Courier-Oblique' , 'courierBI'->'Courier-BoldOblique' ,
			'helvetica'->'Helvetica', 'helveticaB'->'Helvetica-Bold' , 'helveticaI'->'Helvetica-Oblique' , 'helveticaBI'->'Helvetica-BoldOblique' ,
			'times'->'Times-Roman' , 'timesB'->'Times-Bold' , 'timesI'->'Times-Oblique' , 'timesBI'->'Times-BoldItalic' ,
			'symbol'->'Symbol' , 'symbolB'->'Symbol' , 'symbolI'->'Symbol' , 'symbolBI'->'Symbol' ,
			'zapfdingbats'->'ZapfDingbats' , 'zapfdingbatsB'->'ZapfDingbats' , 'zapfdingbatsI'->'ZapfDingbats' , 'zapfdingbatsBI'->'ZapfDingbats'			 
		)
	]
]

{ #category : #accessing }
PDFDocument >> format [
	^format
]

{ #category : #accessing }
PDFDocument >> format: aValue [
	format := aValue
]

{ #category : #action }
PDFDocument >> generate [
	" answer the PDF file"
	^self document
	
	

]

{ #category : #accessing }
PDFDocument >> height [
	^(self size y)
]

{ #category : #'initialize-release' }
PDFDocument >> initialize [
	super initialize.
	self setFormat: PDFFormatA4 new.
	self setPortrait.
	self setAutoPageBreak: true margin: self margin.

	
]

{ #category : #accessing }
PDFDocument >> leftMargin [
	^(self margins x)
]

{ #category : #private }
PDFDocument >> margin [
	^(self format margin / self scaleFactor)
]

{ #category : #accessing }
PDFDocument >> margins [
	^margins
]

{ #category : #accessing }
PDFDocument >> margins: aValue [
	margins := aValue
]

{ #category : #accessing }
PDFDocument >> orientation [
	^ orientation
]

{ #category : #accessing }
PDFDocument >> orientation: aValue [
	orientation := aValue
]

{ #category : #private }
PDFDocument >> out: aString [
	"append the string to the document"
	self document: self document , aString.
]

{ #category : #accessing }
PDFDocument >> page [
	"answer the current page number"
	^page ifNil: [ page := 0 ]
]

{ #category : #accessing }
PDFDocument >> page: aValue [
	"set the current page number"
	page := aValue
]

{ #category : #accessing }
PDFDocument >> pageBreakTrigger [
	^pageBreakTrigger
]

{ #category : #accessing }
PDFDocument >> pageBreakTrigger: aValue [
	pageBreakTrigger := aValue
]

{ #category : #accessing }
PDFDocument >> pages [
	^ pages ifNil: [ pages := OrderedCollection new ]
]

{ #category : #accessing }
PDFDocument >> pages: aPDFPage [
	pages := aPDFPage
]

{ #category : #accessing }
PDFDocument >> scaleFactor [
	scaleFactor ifNil: [ self usePointsAsUnit ].
	^scaleFactor
]

{ #category : #accessing }
PDFDocument >> scaleFactor: aValue [
	scaleFactor := aValue
]

{ #category : #'page setup' }
PDFDocument >> setAutoPageBreak: mode [
	self autoPageBreak: mode.
	self pageBreakTrigger: (self height) / self scaleFactor.
]

{ #category : #'page setup' }
PDFDocument >> setAutoPageBreak: mode margin: aMargin [
	self autoPageBreak: mode.
	self pageBreakTrigger: (self height / self scaleFactor) -  aMargin
]

{ #category : #private }
PDFDocument >> setDefaultMargins [
	self setMargins: (self margin) top: (self margin)

]

{ #category : #'page setup' }
PDFDocument >> setFormat: aFormat [
	self format: aFormat.
	self setDefaultMargins.
]

{ #category : #'page setup' }
PDFDocument >> setLandscape [
	"Set the page in landscape orientation"
	self setSize: (self format size y) height: (self format size x)..	
]

{ #category : #'page setup' }
PDFDocument >> setMargins: leftMargin top: topMargin [
	"set the left and top margins"
	
	self margins: leftMargin@topMargin.

]

{ #category : #'page setup' }
PDFDocument >> setPortrait [
	"Set the page in portrait orientation"
	self setSize: (self format size x) height: (self format size y). 

	
]

{ #category : #'page setup' }
PDFDocument >> setSize: width height: height [
	"set the size of the document"

	self size: width@height
]

{ #category : #accessing }
PDFDocument >> size [
	^size
]

{ #category : #accessing }
PDFDocument >> size: aValue [
	size := aValue
]

{ #category : #accessing }
PDFDocument >> topMargin [
	^(self margins y)
]

{ #category : #'page setup' }
PDFDocument >> useCentimetersAsUnit [
	self scaleFactor: 72 / 2.54.
]

{ #category : #'page setup' }
PDFDocument >> useInchsAsUnit [
	self scaleFactor: 72.
]

{ #category : #'page setup' }
PDFDocument >> useMillimetersAsUnit [
	self scaleFactor: 72 / 25.4.
]

{ #category : #'page setup' }
PDFDocument >> usePointsAsUnit [
	self scaleFactor: 1.
]

{ #category : #accessing }
PDFDocument >> width [
	^(self size x)
]
