"
#!/usr/bin/rebol

REBOL []

code: {
}
result: """"
str: """"
parse code [ any [ thru ""=>"" copy str to "","" ( append result (join str "" . "")) ] ] 
print result


PDFDocument has not been documented yet. The class comment should describe the purpose of the class, its collaborations and its variables.

Instance Variables:
	title	<String>
	subject	<String>
	author	<String>
	keywords	<String>
	creator	<String>
	buffer	<AbstractSound | Announcement class | Collection | Exception class | ExceptionSet>
	numberOfObjects	<Collection | Color | DateAndTime | Duration | Number | Point | Timespan | TraitComposition | TraitDescription | TraitTransformation>
	pages	<OrderedCollection>
	offsets	<Dictionary>
	offset	<ProtoObject | PseudoContext>
	fontNames	<ProtoObject>
	fonts	<Dictionary>
	orientation	<ProtoObject | PseudoContext>
	pageNumber	<Integer>
	format	<MarginBorder | PDFDocument | PDFFormat>
	size	<Point | TTPoint>
	margins	<Point | TTPoint>
	scaleFactor	<Number | Point>
	autoPageBreak	<ProtoObject | PseudoContext>
	pageBreakTrigger	<ProtoObject | PseudoContext>
	currentFont	<PDFCurrentFont>
	images	<ProtoObject | PseudoContext>
	charWidths	<ProtoObject>
"
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
		'images',
		'charWidths'
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

{ #category : #fonts }
PDFDocument >> charWidths [
	"Answer the char widths for each fonts"
	
	^charWidths ifNil: [
		charWidths := {
			'courier'->(self setCharWidths: (self courierWidths)) . 
			'courierB'->(self setCharWidths: (self courierBWidths)) . 
			'courierI'->(self setCharWidths: (self courierIWidths)) . 
			'courierBI'->(self setCharWidths: (self courierBIWidths)) .
			
			'helvetica'->(self setCharWidths: (self helveticaWidths)) . 
			'helveticaB'->(self setCharWidths: (self helveticaBWidths)) . 
			'helveticaI'->(self setCharWidths: (self helveticaIWidths)) . 
			'helveticaBI'->(self setCharWidths: (self helveticaBIWidths)) .

			'symbol'->(self setCharWidths: (self symbolWidths)) . 
			
			'times'->(self setCharWidths: (self timesWidths)) . 
			'timesB'->(self setCharWidths: (self timesBWidths)) . 
			'timesI'->(self setCharWidths: (self timesIWidths)) . 
			'timesBI'->(self setCharWidths: (self timesBIWidths)) . 
			
			'zapfdingbats'->(self setCharWidths: (self zapfdingbatsWidths)) 
		} asDictionary.	
	].

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

{ #category : #fonts }
PDFDocument >> courierBIWidths [
	
	"answer the widths for each characters of the courier font (bold & italic)"
	
	^{ 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 } asOrderedCollection.
]

{ #category : #fonts }
PDFDocument >> courierBWidths [
	
	"answer the widths for each characters of the courier font (bold)"
	
	^{ 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 } asOrderedCollection.
]

{ #category : #fonts }
PDFDocument >> courierIWidths [
	
	"answer the widths for each characters of the courier font italic)"
	
	^{ 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 } asOrderedCollection.
]

{ #category : #fonts }
PDFDocument >> courierWidths [
	
	"answer the widths for each characters of the courier font"
	
	^{ 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 . 600 } asOrderedCollection.
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

{ #category : #fonts }
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

	"Transcript clear; show: self buffer."
	^self buffer
	
]

{ #category : #action }
PDFDocument >> getIdealFontSizeOfString: aString width: aWidth with: aFont [
	"answer the ideal font size for the specified width. The size of the font is not modified"

	| fsize width originalFontSize |
	fsize := 0.
	width := 0.
	
	originalFontSize := aFont fontSize.
	[ width >=  aWidth ] whileFalse: [
		fsize := fsize + 1. 
		aFont fontSize: fsize.
		width := self getStringWidth: aString with: aFont.
		Transcript show: (fsize asString , '->' , width asString);cr.

	].
	aFont fontSize: originalFontSize.
	^(fsize - 1)
	
	
]

{ #category : #action }
PDFDocument >> getStringWidth: aString with: aFont [
	"answer the width of the string with the specified font"
	
	| width |
	
	width := 0.
	aString do: [ :char | width := width + ((self charWidths at: (aFont family)) at: char) ].

	^(width * ((aFont fontSize  / self scaleFactor) / 1000)) roundDownTo: 0.001	
	
	
]

{ #category : #accessing }
PDFDocument >> height [
	^(self size y)
]

{ #category : #fonts }
PDFDocument >> helveticaBIWidths [
	
	"answer the widths for each characters of the helvetica (bold & italic) font"
	
	^{ 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 333 . 474 . 556 . 556 . 889 . 722 . 238 . 333 . 333 . 389 . 584 . 278 . 333 . 278 . 278 . 556 . 556 . 556 . 556 . 556 . 556 . 556 . 556 . 556 . 556 . 333 . 333 . 584 . 584 . 584 . 611 . 975 . 722 . 722 . 722 . 722 . 667 . 611 . 778 . 722 . 278 . 556 . 722 . 611 . 833 . 722 . 778 . 667 . 778 . 722 . 667 . 611 . 722 . 667 . 944 . 667 . 667 . 611 . 333 . 278 . 333 . 584 . 556 . 333 . 556 . 611 . 556 . 611 . 556 . 333 . 611 . 611 . 278 . 278 . 556 . 278 . 889 . 611 . 611 . 611 . 611 . 389 . 556 . 333 . 611 . 556 . 778 . 556 . 556 . 500 . 389 . 280 . 389 . 584 . 350 . 556 . 350 . 278 . 556 . 500 . 1000 . 556 . 556 . 333 . 1000 . 667 . 333 . 1000 . 350 . 611 . 350 . 350 . 278 . 278 . 500 . 500 . 350 . 556 . 1000 . 333 . 1000 . 556 . 333 . 944 . 350 . 500 . 667 . 278 . 333 . 556 . 556 . 556 . 556 . 280 . 556 . 333 . 737 . 370 . 556 . 584 . 333 . 737 . 333 . 400 . 584 . 333 . 333 . 333 . 611 . 556 . 278 . 333 . 333 . 365 . 556 . 834 . 834 . 834 . 611 . 722 . 722 . 722 . 722 . 722 . 722 . 1000 . 722 . 667 . 667 . 667 . 667 . 278 . 278 . 278 . 278 . 722 . 722 . 778 . 778 . 778 . 778 . 778 . 584 . 778 . 722 . 722 . 722 . 722 . 667 . 667 . 611 . 556 . 556 . 556 . 556 . 556 . 556 . 889 . 556 . 556 . 556 . 556 . 556 . 278 . 278 . 278 . 278 . 611 . 611 . 611 . 611 . 611 . 611 . 611 . 584 . 611 . 611 . 611 . 611 . 611 . 556 . 611 } asOrderedCollection.
	
	
]

{ #category : #fonts }
PDFDocument >> helveticaBWidths [
	
	"answer the widths for each characters of the helvetica (bold) font"
	
	^{ 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 333 . 474 . 556 . 556 . 889 . 722 . 238 . 333 . 333 . 389 . 584 . 278 . 333 . 278 . 278 . 556 . 556 . 556 . 556 . 556 . 556 . 556 . 556 . 556 . 556 . 333 . 333 . 584 . 584 . 584 . 611 . 975 . 722 . 722 . 722 . 722 . 667 . 611 . 778 . 722 . 278 . 556 . 722 . 611 . 833 . 722 . 778 . 667 . 778 . 722 . 667 . 611 . 722 . 667 . 944 . 667 . 667 . 611 . 333 . 278 . 333 . 584 . 556 . 333 . 556 . 611 . 556 . 611 . 556 . 333 . 611 . 611 . 278 . 278 . 556 . 278 . 889 . 611 . 611 . 611 . 611 . 389 . 556 . 333 . 611 . 556 . 778 . 556 . 556 . 500 . 389 . 280 . 389 . 584 . 350 . 556 . 350 . 278 . 556 . 500 . 1000 . 556 . 556 . 333 . 1000 . 667 . 333 . 1000 . 350 . 611 . 350 . 350 . 278 . 278 . 500 . 500 . 350 . 556 . 1000 . 333 . 1000 . 556 . 333 . 944 . 350 . 500 . 667 . 278 . 333 . 556 . 556 . 556 . 556 . 280 . 556 . 333 . 737 . 370 . 556 . 584 . 333 . 737 . 333 . 400 . 584 . 333 . 333 . 333 . 611 . 556 . 278 . 333 . 333 . 365 . 556 . 834 . 834 . 834 . 611 . 722 . 722 . 722 . 722 . 722 . 722 . 1000 . 722 . 667 . 667 . 667 . 667 . 278 . 278 . 278 . 278 . 722 . 722 . 778 . 778 . 778 . 778 . 778 . 584 . 778 . 722 . 722 . 722 . 722 . 667 . 667 . 611 . 556 . 556 . 556 . 556 . 556 . 556 . 889 . 556 . 556 . 556 . 556 . 556 . 278 . 278 . 278 . 278 . 611 . 611 . 611 . 611 . 611 . 611 . 611 . 584 . 611 . 611 . 611 . 611 . 611 . 556 . 611 } asOrderedCollection.
	
]

{ #category : #fonts }
PDFDocument >> helveticaIWidths [
	
	"answer the widths for each characters of the helvetica (italic) font"
	
	^{ 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 355 . 556 . 556 . 889 . 667 . 191 . 333 . 333 . 389 . 584 . 278 . 333 . 278 . 278 . 556 . 556 . 556 . 556 . 556 . 556 . 556 . 556 . 556 . 556 . 278 . 278 . 584 . 584 . 584 . 556 . 1015 . 667 . 667 . 722 . 722 . 667 . 611 . 778 . 722 . 278 . 500 . 667 . 556 . 833 . 722 . 778 . 667 . 778 . 722 . 667 . 611 . 722 . 667 . 944 . 667 . 667 . 611 . 278 . 278 . 278 . 469 . 556 . 333 . 556 . 556 . 500 . 556 . 556 . 278 . 556 . 556 . 222 . 222 . 500 . 222 . 833 . 556 . 556 . 556 . 556 . 333 . 500 . 278 . 556 . 500 . 722 . 500 . 500 . 500 . 334 . 260 . 334 . 584 . 350 . 556 . 350 . 222 . 556 . 333 . 1000 . 556 . 556 . 333 . 1000 . 667 . 333 . 1000 . 350 . 611 . 350 . 350 . 222 . 222 . 333 . 333 . 350 . 556 . 1000 . 333 . 1000 . 500 . 333 . 944 . 350 . 500 . 667 . 278 . 333 . 556 . 556 . 556 . 556 . 260 . 556 . 333 . 737 . 370 . 556 . 584 . 333 . 737 . 333 . 400 . 584 . 333 . 333 . 333 . 556 . 537 . 278 . 333 . 333 . 365 . 556 . 834 . 834 . 834 . 611 . 667 . 667 . 667 . 667 . 667 . 667 . 1000 . 722 . 667 . 667 . 667 . 667 . 278 . 278 . 278 . 278 . 722 . 722 . 778 . 778 . 778 . 778 . 778 . 584 . 778 . 722 . 722 . 722 . 722 . 667 . 667 . 611 . 556 . 556 . 556 . 556 . 556 . 556 . 889 . 500 . 556 . 556 . 556 . 556 . 278 . 278 . 278 . 278 . 556 . 556 . 556 . 556 . 556 . 556 . 556 . 584 . 611 . 556 . 556 . 556 . 556 . 500 . 556 } asOrderedCollection.
	
	
]

{ #category : #fonts }
PDFDocument >> helveticaWidths [
	
	"answer the widths for each characters of the helvetica font"

	^{ 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 278 . 355 . 556 . 556 . 889 . 667 . 191 . 333 . 333 . 389 . 584 . 278 . 333 . 278 . 278 . 556 . 556 . 556 . 556 . 556 . 556 . 556 . 556 . 556 . 556 . 278 . 278 . 584 . 584 . 584 . 556 . 1015 . 667 . 667 . 722 . 722 . 667 . 611 . 778 . 722 . 278 . 500 . 667 . 556 . 833 . 722 . 778 . 667 . 778 . 722 . 667 . 611 . 722 . 667 . 944 . 667 . 667 . 611 . 278 . 278 . 278 . 469 . 556 . 333 . 556 . 556 . 500 . 556 . 556 . 278 . 556 . 556 . 222 . 222 . 500 . 222 . 833 . 556 . 556 . 556 . 556 . 333 . 500 . 278 . 556 . 500 . 722 . 500 . 500 . 500 . 334 . 260 . 334 . 584 . 350 . 556 . 350 . 222 . 556 . 333 . 1000 . 556 . 556 . 333 . 1000 . 667 . 333 . 1000 . 350 . 611 . 350 . 350 . 222 . 222 . 333 . 333 . 350 . 556 . 1000 . 333 . 1000 . 500 . 333 . 944 . 350 . 500 . 667 . 278 . 333 . 556 . 556 . 556 . 556 . 260 . 556 . 333 . 737 . 370 . 556 . 584 . 333 . 737 . 333 . 400 . 584 . 333 . 333 . 333 . 556 . 537 . 278 . 333 . 333 . 365 . 556 . 834 . 834 . 834 . 611 . 667 . 667 . 667 . 667 . 667 . 667 . 1000 . 722 . 667 . 667 . 667 . 667 . 278 . 278 . 278 . 278 . 722 . 722 . 778 . 778 . 778 . 778 . 778 . 584 . 778 . 722 . 722 . 722 . 722 . 667 . 667 . 611 . 556 . 556 . 556 . 556 . 556 . 556 . 889 . 500 . 556 . 556 . 556 . 556 . 278 . 278 . 278 . 278 . 556 . 556 . 556 . 556 . 556 . 556 . 556 . 584 . 611 . 556 . 556 . 556 . 556 . 500 . 556 } asOrderedCollection.
	
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

	self setFormat: PDFA4Format new.
	self setPortrait.
	self setAutoPageBreak: true margin: self margin.
	
	self currentFont: PDFCurrentFont new.
	self setCurrentFont: 'helvetica' size: 12 bold: false italic: false.
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
	self out: ('/Subject ' , (self textString: self subject)).	
	self out: ('/Author ' , (self textString: self author)).
	self out: ('/Keywords ' , (self textString: self keywords)).
	self out: ('/Creator ' , (self textString: self creator)).
	self out: ('/CreationDate (D:' , self dateAndTimeInPDFFormat , ')').
	self out: '>>'.
	self out: 'endobj'.
	
	

]

{ #category : #private }
PDFDocument >> insertTrailer: aBufferSize [
	"Insert the trailer in the PDF document"
	
	self out: 'trailer'.
	self out: ('<< /Size ' , (self numberOfObjects + 1) asString).
	self out: ('/Root ' , (self numberOfObjects asString) , ' 0 R').
	self out: ('/Info ' , (self numberOfObjects - 1) asString , ' 0 R >>').
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

{ #category : #fonts }
PDFDocument >> setCharWidths: aWidthsCollection [
	"answer a dictionnay that contains the size of each char"
	
	| widths |
	widths := Dictionary new.
	
	1 to: 255 do: [ :i | widths at: (Character value: (i - 1))  put: (aWidthsCollection at: i) ].
	^widths
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

{ #category : #fonts }
PDFDocument >> symbolWidths [
	
	"answer the widths for each characters of the symbol font"
	
	^{ 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 333 . 713 . 500 . 549 . 833 . 778 . 439 . 333 . 333 . 500 . 549 . 250 . 549 . 250 . 278 . 500 . 500 . 500 . 500 . 500 . 500 . 500 . 500 . 500 . 500 . 278 . 278 . 549 . 549 . 549 . 444 . 549 . 722 . 667 . 722 . 612 . 611 . 763 . 603 . 722 . 333 . 631 . 722 . 686 . 889 . 722 . 722 . 768 . 741 . 556 . 592 . 611 . 690 . 439 . 768 . 645 . 795 . 611 . 333 . 863 . 333 . 658 . 500 . 500 . 631 . 549 . 549 . 494 . 439 . 521 . 411 . 603 . 329 . 603 . 549 . 549 . 576 . 521 . 549 . 549 . 521 . 549 . 603 . 439 . 576 . 713 . 686 . 493 . 686 . 494 . 480 . 200 . 480 . 549 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 750 . 620 . 247 . 549 . 167 . 713 . 500 . 753 . 753 . 753 . 753 . 1042 . 987 . 603 . 987 . 603 . 400 . 549 . 411 . 549 . 549 . 713 . 494 . 460 . 549 . 549 . 549 . 549 . 1000 . 603 . 1000 . 658 . 823 . 686 . 795 . 987 . 768 . 768 . 823 . 768 . 768 . 713 . 713 . 713 . 713 . 713 . 713 . 713 . 768 . 713 . 790 . 790 . 890 . 823 . 549 . 250 . 713 . 603 . 603 . 1042 . 987 . 603 . 987 . 603 . 494 . 329 . 790 . 790 . 786 . 713 . 384 . 384 . 384 . 384 . 384 . 384 . 494 . 494 . 494 . 494 . 0 . 329 . 274 . 686 . 686 . 686 . 384 . 384 . 384 . 384 . 384 . 384 . 494 . 494 . 494 } asOrderedCollection.

]

{ #category : #tools }
PDFDocument >> textString: aString [
	"Format a text string"
	
	^('(' , (self escape: aString) , ')')
]

{ #category : #fonts }
PDFDocument >> timesBIWidths [
	
	"answer the widths for each characters of the Times font (bold & italic)"
	
	^{ 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 389 . 555 . 500 . 500 . 833 . 778 . 278 . 333 . 333 . 500 . 570 . 250 . 333 . 250 . 278 . 500 . 500 . 500 . 500 . 500 . 500 . 500 . 500 . 500 . 500 . 333 . 333 . 570 . 570 . 570 . 500 . 832 . 667 . 667 . 667 . 722 . 667 . 667 . 722 . 778 . 389 . 500 . 667 . 611 . 889 . 722 . 722 . 611 . 722 . 667 . 556 . 611 . 722 . 667 . 889 . 667 . 611 . 611 . 333 . 278 . 333 . 570 . 500 . 333 . 500 . 500 . 444 . 500 . 444 . 333 . 500 . 556 . 278 . 278 . 500 . 278 . 778 . 556 . 500 . 500 . 500 . 389 . 389 . 278 . 556 . 444 . 667 . 500 . 444 . 389 . 348 . 220 . 348 . 570 . 350 . 500 . 350 . 333 . 500 . 500 . 1000 . 500 . 500 . 333 . 1000 . 556 . 333 . 944 . 350 . 611 . 350 . 350 . 333 . 333 . 500 . 500 . 350 . 500 . 1000 . 333 . 1000 . 389 . 333 . 722 . 350 . 389 . 611 . 250 . 389 . 500 . 500 . 500 . 500 . 220 . 500 . 333 . 747 . 266 . 500 . 606 . 333 . 747 . 333 . 400 . 570 . 300 . 300 . 333 . 576 . 500 . 250 . 333 . 300 . 300 . 500 . 750 . 750 . 750 . 500 . 667 . 667 . 667 . 667 . 667 . 667 . 944 . 667 . 667 . 667 . 667 . 667 . 389 . 389 . 389 . 389 . 722 . 722 . 722 . 722 . 722 . 722 . 722 . 570 . 722 . 722 . 722 . 722 . 722 . 611 . 611 . 500 . 500 . 500 . 500 . 500 . 500 . 500 . 722 . 444 . 444 . 444 . 444 . 444 . 278 . 278 . 278 . 278 . 500 . 556 . 500 . 500 . 500 . 500 . 500 . 570 . 500 . 556 . 556 . 556 . 556 . 444 . 500 } asOrderedCollection.
	
]

{ #category : #fonts }
PDFDocument >> timesBWidths [
	
	"answer the widths for each characters of the Times font (bold)"
	
	^{ 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 333 . 555 . 500 . 500 . 1000 . 833 . 278 . 333 . 333 . 500 . 570 . 250 . 333 . 250 . 278 . 500 . 500 . 500 . 500 . 500 . 500 . 500 . 500 . 500 . 500 . 333 . 333 . 570 . 570 . 570 . 500 . 930 . 722 . 667 . 722 . 722 . 667 . 611 . 778 . 778 . 389 . 500 . 778 . 667 . 944 . 722 . 778 . 611 . 778 . 722 . 556 . 667 . 722 . 722 . 1000 . 722 . 722 . 667 . 333 . 278 . 333 . 581 . 500 . 333 . 500 . 556 . 444 . 556 . 444 . 333 . 500 . 556 . 278 . 333 . 556 . 278 . 833 . 556 . 500 . 556 . 556 . 444 . 389 . 333 . 556 . 500 . 722 . 500 . 500 . 444 . 394 . 220 . 394 . 520 . 350 . 500 . 350 . 333 . 500 . 500 . 1000 . 500 . 500 . 333 . 1000 . 556 . 333 . 1000 . 350 . 667 . 350 . 350 . 333 . 333 . 500 . 500 . 350 . 500 . 1000 . 333 . 1000 . 389 . 333 . 722 . 350 . 444 . 722 . 250 . 333 . 500 . 500 . 500 . 500 . 220 . 500 . 333 . 747 . 300 . 500 . 570 . 333 . 747 . 333 . 400 . 570 . 300 . 300 . 333 . 556 . 540 . 250 . 333 . 300 . 330 . 500 . 750 . 750 . 750 . 500 . 722 . 722 . 722 . 722 . 722 . 722 . 1000 . 722 . 667 . 667 . 667 . 667 . 389 . 389 . 389 . 389 . 722 . 722 . 778 . 778 . 778 . 778 . 778 . 570 . 778 . 722 . 722 . 722 . 722 . 722 . 611 . 556 . 500 . 500 . 500 . 500 . 500 . 500 . 722 . 444 . 444 . 444 . 444 . 444 . 278 . 278 . 278 . 278 . 500 . 556 . 500 . 500 . 500 . 500 . 500 . 570 . 500 . 556 . 556 . 556 . 556 . 500 . 556 } asOrderedCollection.
	
]

{ #category : #fonts }
PDFDocument >> timesIWidths [
	
	"answer the widths for each characters of the Times font (italic)"
	
	^{ 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 333 . 420 . 500 . 500 . 833 . 778 . 214 . 333 . 333 . 500 . 675 . 250 . 333 . 250 . 278 . 500 . 500 . 500 . 500 . 500 . 500 . 500 . 500 . 500 . 500 . 333 . 333 . 675 . 675 . 675 . 500 . 920 . 611 . 611 . 667 . 722 . 611 . 611 . 722 . 722 . 333 . 444 . 667 . 556 . 833 . 667 . 722 . 611 . 722 . 611 . 500 . 556 . 722 . 611 . 833 . 611 . 556 . 556 . 389 . 278 . 389 . 422 . 500 . 333 . 500 . 500 . 444 . 500 . 444 . 278 . 500 . 500 . 278 . 278 . 444 . 278 . 722 . 500 . 500 . 500 . 500 . 389 . 389 . 278 . 500 . 444 . 667 . 444 . 444 . 389 . 400 . 275 . 400 . 541 . 350 . 500 . 350 . 333 . 500 . 556 . 889 . 500 . 500 . 333 . 1000 . 500 . 333 . 944 . 350 . 556 . 350 . 350 . 333 . 333 . 556 . 556 . 350 . 500 . 889 . 333 . 980 . 389 . 333 . 667 . 350 . 389 . 556 . 250 . 389 . 500 . 500 . 500 . 500 . 275 . 500 . 333 . 760 . 276 . 500 . 675 . 333 . 760 . 333 . 400 . 675 . 300 . 300 . 333 . 500 . 523 . 250 . 333 . 300 . 310 . 500 . 750 . 750 . 750 . 500 . 611 . 611 . 611 . 611 . 611 . 611 . 889 . 667 . 611 . 611 . 611 . 611 . 333 . 333 . 333 . 333 . 722 . 667 . 722 . 722 . 722 . 722 . 722 . 675 . 722 . 722 . 722 . 722 . 722 . 556 . 611 . 500 . 500 . 500 . 500 . 500 . 500 . 500 . 667 . 444 . 444 . 444 . 444 . 444 . 278 . 278 . 278 . 278 . 500 . 500 . 500 . 500 . 500 . 500 . 500 . 675 . 500 . 500 . 500 . 500 . 500 . 444 . 500 } asOrderedCollection.
	
]

{ #category : #fonts }
PDFDocument >> timesWidths [
	
	"answer the widths for each characters of the Times font"
	
	^{ 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 250 . 333 . 408 . 500 . 500 . 833 . 778 . 180 . 333 . 333 . 500 . 564 . 250 . 333 . 250 . 278 . 500 . 500 . 500 . 500 . 500 . 500 . 500 . 500 . 500 . 500 . 278 . 278 . 564 . 564 . 564 . 444 . 921 . 722 . 667 . 667 . 722 . 611 . 556 . 722 . 722 . 333 . 389 . 722 . 611 . 889 . 722 . 722 . 556 . 722 . 667 . 556 . 611 . 722 . 722 . 944 . 722 . 722 . 611 . 333 . 278 . 333 . 469 . 500 . 333 . 444 . 500 . 444 . 500 . 444 . 333 . 500 . 500 . 278 . 278 . 500 . 278 . 778 . 500 . 500 . 500 . 500 . 333 . 389 . 278 . 500 . 500 . 722 . 500 . 500 . 444 . 480 . 200 . 480 . 541 . 350 . 500 . 350 . 333 . 500 . 444 . 1000 . 500 . 500 . 333 . 1000 . 556 . 333 . 889 . 350 . 611 . 350 . 350 . 333 . 333 . 444 . 444 . 350 . 500 . 1000 . 333 . 980 . 389 . 333 . 722 . 350 . 444 . 722 . 250 . 333 . 500 . 500 . 500 . 500 . 200 . 500 . 333 . 760 . 276 . 500 . 564 . 333 . 760 . 333 . 400 . 564 . 300 . 300 . 333 . 500 . 453 . 250 . 333 . 300 . 310 . 500 . 750 . 750 . 750 . 444 . 722 . 722 . 722 . 722 . 722 . 722 . 889 . 667 . 611 . 611 . 611 . 611 . 333 . 333 . 333 . 333 . 722 . 722 . 722 . 722 . 722 . 722 . 722 . 564 . 722 . 722 . 722 . 722 . 722 . 722 . 556 . 500 . 444 . 444 . 444 . 444 . 444 . 444 . 667 . 444 . 444 . 444 . 444 . 444 . 278 . 278 . 278 . 278 . 500 . 500 . 500 . 500 . 500 . 500 . 500 . 564 . 500 . 500 . 500 . 500 . 500 . 500 . 500 } asOrderedCollection.
	
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

{ #category : #fonts }
PDFDocument >> zapfdingbatsWidths [
	
	"answer the widths for each characters of the zapfdingbats font"
	
	^{ 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 278 . 974 . 961 . 974 . 980 . 719 . 789 . 790 . 791 . 690 . 960 . 939 . 549 . 855 . 911 . 933 . 911 . 945 . 974 . 755 . 846 . 762 . 761 . 571 . 677 . 763 . 760 . 759 . 754 . 494 . 552 . 537 . 577 . 692 . 786 . 788 . 788 . 790 . 793 . 794 . 816 . 823 . 789 . 841 . 823 . 833 . 816 . 831 . 923 . 744 . 723 . 749 . 790 . 792 . 695 . 776 . 768 . 792 . 759 . 707 . 708 . 682 . 701 . 826 . 815 . 789 . 789 . 707 . 687 . 696 . 689 . 786 . 787 . 713 . 791 . 785 . 791 . 873 . 761 . 762 . 762 . 759 . 759 . 892 . 892 . 788 . 784 . 438 . 138 . 277 . 415 . 392 . 392 . 668 . 668 . 0 . 390 . 390 . 317 . 317 . 276 . 276 . 509 . 509 . 410 . 410 . 234 . 234 . 334 . 334 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 . 732 . 544 . 544 . 910 . 667 . 760 . 760 . 776 . 595 . 694 . 626 . 788 . 788 . 788 . 788 . 788 . 788 . 788 . 788 . 788 . 788 . 788 . 788 . 788 . 788 . 788 . 788 . 788 . 788 . 788 . 788 . 788 . 788 . 788 . 788 . 788 . 788 . 788 . 788 . 788 . 788 . 788 . 788 . 788 . 788 . 788 . 788 . 788 . 788 . 788 . 788 . 894 . 838 . 1016 . 458 . 748 . 924 . 748 . 918 . 927 . 928 . 928 . 834 . 873 . 828 . 924 . 924 . 917 . 930 . 931 . 463 . 883 . 836 . 836 . 867 . 867 . 696 . 696 . 874 . 0 . 874 . 760 . 946 . 771 . 865 . 771 . 888 . 967 . 888 . 831 . 873 . 927 . 970 . 918 } asOrderedCollection.
	
]
