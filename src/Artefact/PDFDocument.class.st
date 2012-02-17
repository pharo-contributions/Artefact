Class {
	#name : #PDFDocument,
	#superclass : #Object,
	#instVars : [
		'buffer',
		'numberOfObjects',
		'pages',
		'offsets',
		'offset',
		'fontNames',
		'fonts',
		'orientation',
		'pageNumber',
		'format',
		'size',
		'margins',
		'scaleFactor',
		'autoPageBreak',
		'pageBreakTrigger',
		'currentFont'
	],
	#category : #Artefact
}

{ #category : #action }
PDFDocument >> add: aPage [
	"add a new page in the PDF document"
	self pageNumber: self pageNumber + 1.
	"aPage number: self page."
	self pages add: (aPage number: self pageNumber).

	
	

]

{ #category : #private }
PDFDocument >> addTheListOfFonts [
	"Add the list of fonts in the PDF document"
	
	(self fonts) keysAndValuesDo: [ :key :counter | 
		self newObj.
		self out: '<< /Type /Font'.
		self out: '/Subtype /Type1'.
		self out: ('/BaseFont /' , (self fontFullName: key)).
		self out: '/Encoding /WinAnsiEncoding >>'.
		self out: 'endobj'.
	].


]

{ #category : #private }
PDFDocument >> addThepagesRoot [
	"Add the pages root"
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
	"Start a new page with a default font"

	self offset: self buffer size.
	self newObj.
	self out: '<< /Type /Page'.
	self out: '/Parent 1 0 R'.
	self out:  '/Contents ' , (self numberOfObjects + 1) asString , ' 0 R >>'.
	self out: 'endobj'.
	"Begin of page contents"
	self newObj.
	self out: '<< /Length ' , (self numberOfObjects + 1) asString  , ' 0 R >>'.
	self out: 'stream'.
	self offset: self buffer size.
	self out: ((self scaleFactor roundDownTo: 0.000001) asString) , ' 0 0 ' , ((self scaleFactor roundDownTo: 0.000001) asString) , ' 0 ' , (self height asString) , ' cm'.
	
	"Set line width to 1 point"
	self out: ((1 / self scaleFactor) roundDownTo: 0.001) asString , ' w'.
	
	"Set line cap style to square"
	self out: '2 J'.
	
	"Set a default font"
	self out: (PDFFontStyle new family: 'helvetica'; fontSize: 14; render: self )
	


	
]

{ #category : #accessing }
PDFDocument >> buffer [
	^ buffer ifNil: [ buffer := '%PDF-1.3' , (String cr) ]
]

{ #category : #accessing }
PDFDocument >> buffer: bodyOfPDFDocument [
	buffer := bodyOfPDFDocument
]

{ #category : #accessing }
PDFDocument >> currentFont [
	^currentFont
]

{ #category : #accessing }
PDFDocument >> currentFont: aCurrentFont [
	currentFont := aCurrentFont
]

{ #category : #private }
PDFDocument >> endDoc [
	"End of the PDF document"
	
	self addTheListOfFonts.
	self addThepagesRoot.


]

{ #category : #private }
PDFDocument >> endPage: aPageSize [

	"End of the page contents"
	self out: 'endstream'.
	self out: 'endobj'.
	"Size of page contents stream"
	self newObj.
	self out: (aPageSize asString).
	self out: 'endobj'.
]

{ #category : #private }
PDFDocument >> fontFullName: aFontName [
	"Answer the full name of a font"

	^ ((self fontNames) at: aFontName)
]

{ #category : #accessing }
PDFDocument >> fontNames [
	^ fontNames ifNil: [ 
		fontNames := {
			'courier'->'Courier' . 'courierB'->'Courier-Bold' . 'courierI' -> 'Courier-Oblique' . 'courierBI'->'Courier-BoldOblique' .
			'helvetica'->'Helvetica' . 'helveticaB'->'Helvetica-Bold' . 'helveticaI'->'Helvetica-Oblique' . 'helveticaBI'->'Helvetica-BoldOblique' .
			'times'->'Times-Roman' . 'timesB'->'Times-Bold' . 'timesI'->'Times-Oblique' . 'timesBI'->'Times-BoldItalic' .
			'symbol'->'Symbol' . 'symbolB'->'Symbol' . 'symbolI'->'Symbol' . 'symbolBI'->'Symbol' .
			'zapfdingbats'->'ZapfDingbats' . 'zapfdingbatsB'->'ZapfDingbats' . 'zapfdingbatsI'->'ZapfDingbats' . 'zapfdingbatsBI'->'ZapfDingbats'			
		} asDictionary.
	]
]

{ #category : #accessing }
PDFDocument >> fonts [
	"answer a collection of used fonts"
	
	^fonts ifNil: [ fonts := Dictionary  new ]
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

	self pages do: [ :page |
		page xy: self margins.
		page lasth: 0.
		
		"Start of the page"
		self beginPage.
		
		"construct each styles in the document context"
		page styles do: [ :style | 
			(style className = 'PDFCellStyle') ifTrue: [ style xy: page xy ].
			self out: (style render: self).
			(style className = 'PDFCellStyle') ifTrue: [
				page lasth: style wh y.
				(style linefeed) ifTrue: [ page xy: (self margins x) @ (page xy y + style wh y) ] ifFalse: [ page xy: (page xy x + style wh x) @ (page xy y) ]				
			].
			(style className = 'PDFLineFeed') ifTrue: [
				"Line feed; default value is last cell height"
				page xy: self margins x @ page xy y.
				(style height isNil) ifTrue: [ page xy: page xy x @ (page xy y + self lasth)] ifFalse: [ page xy: page xy x @ page xy y + style height ].
			]
		].
		"End of the page contents"
		self endPage:  (self buffer size) - (self offset).
	].
	"End of the document"
	self endDoc.

	^self buffer
	
]

{ #category : #accessing }
PDFDocument >> height [
	^(self size y)
]

{ #category : #'initialize-release' }
PDFDocument >> initialize [
	super initialize.
	self currentFont: PDFCurrentFont new.
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

{ #category : #private }
PDFDocument >> newObj [
	"add the begin of a new object"
	self numberOfObjects: self numberOfObjects + 1.
	self offsets at: self numberOfObjects put: (self buffer size).
	self out: (self numberOfObjects asString , ' 0 obj').

]

{ #category : #accessing }
PDFDocument >> numberOfObjects [
	^ numberOfObjects ifNil: [ numberOfObjects := 1 ]
]

{ #category : #accessing }
PDFDocument >> numberOfObjects: aValue [
	numberOfObjects := aValue
]

{ #category : #accessing }
PDFDocument >> offset [
	^ offset ifNil: [ offset := 0 ]
]

{ #category : #accessing }
PDFDocument >> offset: aValue [
	offset := aValue
]

{ #category : #accessing }
PDFDocument >> offsets [
	"array of object offsets"
	^ offsets ifNil: [ offsets := Dictionary new ]
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
	self buffer: self buffer , aString , String cr.
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
PDFDocument >> pageNumber [
	"answer the current page number"
	^pageNumber ifNil: [ pageNumber := 0 ]
]

{ #category : #accessing }
PDFDocument >> pageNumber: aValue [
	"set the current page number"
	pageNumber := aValue
]

{ #category : #accessing }
PDFDocument >> pages [
	^ pages ifNil: [ pages := OrderedCollection new ]
]

{ #category : #accessing }
PDFDocument >> pages: aListOfPDFPage [
	pages := aListOfPDFPage
]

{ #category : #accessing }
PDFDocument >> scaleFactor [
	scaleFactor ifNil: [ self useMillimetersAsUnit ].
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
PDFDocument >> setCurrentFont: aFamily size: aSizePt bold: aBoldValue italic: aItalicValue [
	"Set the current font used in the document"
	
	self currentFont fontFamily: aFamily.
	self currentFont fontSizePt: aSizePt.
	self currentFont fontSize: ((aSizePt / self scaleFactor) roundDownTo: 0.01).
	self currentFont bold: aBoldValue.
	self currentFont italic: aItalicValue.


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
	self scaleFactor:  (72 / 2.54).
]

{ #category : #'page setup' }
PDFDocument >> useInchsAsUnit [
	self scaleFactor: 72.
]

{ #category : #'page setup' }
PDFDocument >> useMillimetersAsUnit [
	self scaleFactor: (72 / 25.4).
]

{ #category : #'page setup' }
PDFDocument >> usePointsAsUnit [
	self scaleFactor: 1.
]

{ #category : #accessing }
PDFDocument >> width [
	^(self size x)
]
