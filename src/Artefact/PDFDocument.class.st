Class {
	#name : #PDFDocument,
	#superclass : #Object,
	#instVars : [
		'title',
		'subject',
		'author',
		'keywords',
		'creator',
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
		'currentFont',
		'images'
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
		self out: '<<'.
		self out: '/Type /Font'.
		self out: '/Subtype /Type1'.
		self out: ('/BaseFont /' , (self fontFullName: key)).
		self out: '/Encoding /WinAnsiEncoding'.
		self out: '>>'.
		self out: 'endobj'.
	].


]

{ #category : #private }
PDFDocument >> addThepagesRoot: aNumberOfObjects [
	"Add the pages root"
	
	| kids bufferSize |
	
	self offsets at: 1 put: (self buffer size).
	self out: '1 0 obj'.
	self out: '<<'.
	self out: '/Type /Pages'.
	
	kids := '/Kids ['.
	0 to: (self pages size - 1) do: [ :i | | v | kids := kids , (2 + (3 * i)) asString , ' 0 R ' ].
	self out: (kids , ']').
	self out: ('/Count ' , self pages size asString).
	self out: ('/MediaBox [0 0 ' , self width asString , ' ' , self height asString , ']').	
	self out: ('/Resources << /ProcSet [/PDF /Text /ImageC]').
	self out: '/Font <<'.
	1 to: (self fonts size) do: [ :i | self out: ('/F' , i asString , ' ' , (aNumberOfObjects + i) asString , ' 0 R' ) ].
	self out: '>>'.
	self out: '/XObject'.
	self out: '<<'.

	"Inserer la partie sur les images"
"
	$nbpal=0;
	reset($this->images);
	while(list(,$info)=each($this->images))
	{
		$this->_out('/I'.$info['n'].' '.($ni+$info['n']+$nbpal).' 0 R');
		if($info['cs']=='Indexed')
			$nbpal++
	}
"
	self out: '>>'.  
	self out: '>>'.
	self out: '>>'.
	self out: 'endobj'.

	"Insert the informations"
	self insertInformations.
	
	"Insert the catalog"
	self insertCatalog.
	
	"save the buffer size"
	bufferSize := self buffer size.
	
	"insert the cross references"
	self insertCrossRef.
	
	"insert the trailer"
	self insertTrailer: bufferSize.

]

{ #category : #accessing }
PDFDocument >> author [
	^ author ifNil: [ author := '' ]
	
]

{ #category : #accessing }
PDFDocument >> author: aString [
	author := aString
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
	self out: '<<'.
	self out: '/Type /Page'.
	self out: '/Parent 1 0 R'.
	self out:  '/Contents ' , (self numberOfObjects + 1) asString , ' 0 R'.
	self out: '>>'.
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
	^ buffer
]

{ #category : #accessing }
PDFDocument >> buffer: bodyOfPDFDocument [
	buffer := bodyOfPDFDocument
]

{ #category : #private }
PDFDocument >> clearBuffer [
	"Clear the buffer to produce a new document"
	self buffer: ('%PDF-1.3' , String crlf).
	self fonts removeAll.
	self numberOfObjects: 1.
	self offset: 0.
	self offsets removeAll.
]

{ #category : #accessing }
PDFDocument >> creator [
	^ creator ifNil: [ creator := '' ]
	
]

{ #category : #accessing }
PDFDocument >> creator: aString [
	creator := aString
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
PDFDocument >> dateAndTimeInPDFFormat [
	"Answer a correct date and time for a PDF document : yyyymmddhhmmss"
	
	| str time hour minutes seconds |
	
	
	hour := Time now hours.
	str := hour asString.
	(hour < 12) ifTrue: [ str := '0' , str ].
	time := str.
	
 	minutes := Time now minutes.
	str := minutes asString.
	(minutes < 10) ifTrue: [ str := '0' , str ].
	time := time , str.
	
	seconds := Time now seconds.
	str := seconds asString.
	(seconds < 10) ifTrue: [ str := '0' , str ].
	time := time , str.
	
	^((Date today yyyymmdd copyWithRegex: '-' matchesReplacedWith: '') , time)
]

{ #category : #private }
PDFDocument >> endDoc [
	"End of the PDF document"
	
	|  nObjects |
	
	nObjects := self numberOfObjects.
	self addTheListOfFonts.
	self addThepagesRoot: nObjects.


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
PDFDocument >> escape: aString [
	"answer a clean string at PDF format"
	
	| str |
	
	str := aString copyWithRegex: '\(' matchesReplacedWith: '\\('.
	str := str copyWithRegex: '\)' matchesReplacedWith: '\\)'.
	str := str copyWithRegex: '\\' matchesReplacedWith: '\\'.	

	^str
]

{ #category : #action }
PDFDocument >> exportToFile: aFileName [
	"Export the PDF document in a file"
	
	| stream |
	stream := StandardFileStream fileNamed: aFileName.
	
	(String crlf split: (self generate)) do: [ :aString | 
		stream nextPutAll: (aString , String crlf).
	].
	stream close.
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

{ #category : #private }
PDFDocument >> formatRef: aRef [
	"Format a reference in the correct format"
	
	| ref str |
	str := ''.
	ref := aRef asString.
	(10 - ref size) timesRepeat: [ str := str , '0' ].

	^(str , ref)
]

{ #category : #action }
PDFDocument >> generate [
	" answer the PDF file"

	self clearBuffer.
		
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

	Transcript clear; show: self buffer.
	^self buffer
	
]

{ #category : #accessing }
PDFDocument >> height [
	^(self size y)
]

{ #category : #accessing }
PDFDocument >> images [
	^images
]

{ #category : #accessing }
PDFDocument >> images: aValue [
	images := aValue
]

{ #category : #'initialize-release' }
PDFDocument >> initialize [
	super initialize.
	self currentFont: PDFCurrentFont new.
	self setFormat: PDFA4Format new.
	self setPortrait.
	self setAutoPageBreak: true margin: self margin.

	
]

{ #category : #private }
PDFDocument >> insertCatalog [
	"insert the catalog"

	self newObj.
	self out: '<<'.
	self out: '/Type /Catalog'.
	self out: '/Pages 1 0 R'.
	self out: '>>'.	
	self out: 'endobj'.

]

{ #category : #private }
PDFDocument >> insertCrossRef [
	"Insert the cross references in the PDF document"
	
	self out: 'xref'.
	self out: ('0 ' , (self numberOfObjects + 1) asString).
	self out: '0000000000 65535 f '.
	1 to: (self numberOfObjects) do: [ :i | self out: ((self formatRef: (self offsets at: i)) , ' 00000 n') ]


]

{ #category : #private }
PDFDocument >> insertInformations [
	"Insert informations in the PDF document"
	
	self newObj.
	self out: ('<<').
	self out: ('/Producer ' , (self textString: (self producer , ' ' , self version))).
	self out: ('/Title ' , (self textString: self title)) .
	"self out: ('/Subject ' , (self textString: self subject)).	
	self out: ('/Author ' , (self textString: self author)).
	self out: ('/Keywords ' , (self textString: self keywords)).
	self out: ('/Creator ' , (self textString: self creator))."
	self out: ('/CreationDate (D:' , self dateAndTimeInPDFFormat , ')').
	self out: '>>'.
	self out: 'endobj'.
	
	

]

{ #category : #private }
PDFDocument >> insertTrailer: aBufferSize [
	"Insert the trailer in the PDF document"
	
	self out: 'trailer'.
	self out: '<<'.
	self out: ('/Size ' , (self numberOfObjects + 1) asString).
	self out: ('/Root ' , (self numberOfObjects asString) , ' 0 R').
	self out: ('/Info ' , (self numberOfObjects + 1) asString , ' 0 R').
	self out: '>>'.
	self out: 'startxref'.
	self out: (aBufferSize asString).
	self buffer: self buffer , '%%EOF'.


]

{ #category : #accessing }
PDFDocument >> keywords [
	^ keywords ifNil: [ keywords := '' ]
	
]

{ #category : #accessing }
PDFDocument >> keywords: aString [
	keywords := aString
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
	^ numberOfObjects 
]

{ #category : #accessing }
PDFDocument >> numberOfObjects: aValue [
	numberOfObjects := aValue
]

{ #category : #accessing }
PDFDocument >> offset [
	^ offset
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
PDFDocument >> out: aItem [
	"append the item (or a list of items) to the document"
	
	(aItem className = 'OrderedCollection') 
		ifTrue: [ aItem do: [ :aValue | self buffer: self buffer , (aValue, String crlf) ] ]
		ifFalse: [ self buffer: self buffer , (aItem, String crlf) ]

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

{ #category : #configuration }
PDFDocument >> producer [
	^'Artefact'
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
PDFDocument >> subject [
	^ subject ifNil: [ subject := '' ]
	
]

{ #category : #accessing }
PDFDocument >> subject: aString [
	subject := aString
]

{ #category : #tools }
PDFDocument >> textString: aString [
	"Format a text string"
	
	^('(' , (self escape: aString) , ')')
]

{ #category : #accessing }
PDFDocument >> title [
	^ title ifNil: [ title := '' ]
	
]

{ #category : #accessing }
PDFDocument >> title: aString [
	title := aString
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

{ #category : #configuration }
PDFDocument >> version [
	^'0.1'
]

{ #category : #accessing }
PDFDocument >> width [
	^(self size x)
]
