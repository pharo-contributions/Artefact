Class {
	#name : #PDFDocument,
	#superclass : #Object,
	#instVars : [
		'document',
		'pages',
		'fonts',
		'orientation',
		'width',
		'height',
		'scaleFactor',
		'lMargin',
		'tMargin',
		'autoPageBreak',
		'pageBreakTrigger'
	],
	#category : #Artefact
}

{ #category : #action }
PDFDocument >> addPage [
	"add a new page in the PDF document"

]

{ #category : #accessing }
PDFDocument >> autoPageBreak [
	^autoPageBreak
]

{ #category : #accessing }
PDFDocument >> autoPageBreak: aLogicValue [
	autoPageBreak := aLogicValue
]

{ #category : #accessing }
PDFDocument >> document [
	^ document ifNil: [ document := '%PDF-1.3' , (String cr) ]
]

{ #category : #accessing }
PDFDocument >> document: bodyOfPDFDocument [
	document := bodyOfPDFDocument
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

{ #category : #action }
PDFDocument >> generate [
	" answer the PDF file"
	
	

]

{ #category : #accessing }
PDFDocument >> height [
	height ifNil: [ self setPortrait ].
	^height
]

{ #category : #accessing }
PDFDocument >> height: aValue [
	height := aValue
]

{ #category : #'initialize-release' }
PDFDocument >> initialize [
	super initialize.
	self setAutoPageBreak: true margin: self margin.

	
]

{ #category : #accessing }
PDFDocument >> lMargin [
	lMargin ifNil: [  self setDefaultMargins ].
	^lMargin
]

{ #category : #accessing }
PDFDocument >> lMargin: aValue [
	lMargin := aValue
]

{ #category : #private }
PDFDocument >> margin [
	^(28.35 / self scaleFactor asFloat)
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
	self pageBreakTrigger: self height / self scaleFactor.
]

{ #category : #'page setup' }
PDFDocument >> setAutoPageBreak: mode margin: aMargin [
	self autoPageBreak: mode.
	self pageBreakTrigger: (self height / self scaleFactor) -  aMargin
]

{ #category : #private }
PDFDocument >> setDefaultMargins [
	self tMargin: self margin.
	self lMargin: self margin.
]

{ #category : #'page setup' }
PDFDocument >> setLandscape [
	"Set the page in landscape orientation"
	self width: 841.9.
	self height: 595.3.	
]

{ #category : #'page setup' }
PDFDocument >> setMargins: leftMargin top: topMargin [
	"set the left and top margins"
	
	self lMargin: leftMargin.
	self tMargin: topMargin.

]

{ #category : #'page setup' }
PDFDocument >> setPortrait [
	"Set the page in portrait orientation"
	self width: 595.3.
	self height: 841.9.
	
]

{ #category : #accessing }
PDFDocument >> tMargin [
	tMargin ifNil: [  self SetDefaultMargins ].
	^tMargin
]

{ #category : #accessing }
PDFDocument >> tMargin: aValue [
	tMargin := aValue
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
	width ifNil: [ self setPortrait ].
	^width
]

{ #category : #accessing }
PDFDocument >> width: aValue [
	width := aValue
]
