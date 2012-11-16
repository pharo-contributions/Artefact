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
		'scaleFactor',
		'autoPageBreak',
		'pageBreakTrigger',
		'currentFont',
		'images',
		'charWidths',
		'styleSheet'
	],
	#category : #Artefact
}

{ #category : #action }
PDFDocument >> add: aPage [
	"add a new page in the PDF document"
	self pageNumber: self pageNumber + 1.
	self pages add: (aPage number: self pageNumber).
	aPage document: self

	
	

]

{ #category : #private }
PDFDocument >> addTheImages [
	"Add the images at the end of the document"
]

{ #category : #private }
PDFDocument >> addTheListOfFonts [
	"Add the list of fonts in the PDF document"
		
	1 to: (self fonts size) do: [ :pos |
		self newObj.
		self out: {  '<<' . '/Type /Font' .  '/Subtype /Type1' . ('/BaseFont /' , (self fontFullName: (self fonts keyAtValue: pos))) .   '/Encoding /WinAnsiEncoding' . '>>' . 'endobj' }.
	]


]

{ #category : #private }
PDFDocument >> addTheOrientations: aNumberOfObjects [
	"each page can have a different orientation (landscape or portrait) and a different size"
	
	self pages do: [ :page |  
			self newObj.
			self out: '<</Type /Page'.
			self out: '/Parent 1 0 R'.
			self out: '/MediaBox [0 0 ' , (page format size y asString) , ' ' , (page format size x asString) , ']'. 
			self out: '/Resources 2 0 R'.
			self out: '/Contents ' , (aNumberOfObjects + 1) asString , ' 0 R>>'.
			self out: 'endobj'.
		].
 
]

{ #category : #private }
PDFDocument >> addThepagesRoot: aNumberOfObjects [
	"Add the pages root"
	
	| kids bufferSize |
	
	self offsets at: 1 put: (self buffer size).
	self out: { '1 0 obj' . '<<' . '/Type /Pages' }.
	kids := '/Kids ['.
	0 to: (self pages size - 1) do: [ :i | | v | kids := kids , (2 + (3 * i)) asString , ' 0 R ' ].
	
	self out: { (kids , ']') . ('/Count ' , self pages size asString) . ('/MediaBox [0 0 ' , self width asString , ' ' , self height asString , ']') . '/Resources << /ProcSet [/PDF /Text /ImageC]' . '/Font <<' }.
	
	1 to: (self fonts size) do: [ :i | self out: ('/F' , i asString , ' ' , (aNumberOfObjects + i) asString , ' 0 R' ) ].
	self out: { '>>' . '/XObject' . '<<' }.

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
	self out: { '>>' . '>>' . '>>' . 'endobj' }.

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
PDFDocument >> beginPage: aPage [
	"Start a new page with a default font"

	self offset: self buffer size.
	self newObj.
	"self out: { '<<' . '/Type /Page' . '/Parent 1 0 R'. '/Resources 2 0 R' }."
self out: { '<<' . '/Type /Page' . '/Parent 1 0 R' }.
	self out: '/MediaBox [0 0 ' , (aPage format size x asString) , ' ' , (aPage format size y asString) , ']'.  
	self out: { ('/Contents ' , (self numberOfObjects + 1) asString , ' 0 R') . '>>' }.
	
	"Begin of page contents"
	self newObj.
	self out: { ('<< /Length ' , (self numberOfObjects + 1) asString  , ' 0 R >>') . 'stream' }.
	self offset: self buffer size.

	"self out: ((self scaleFactor roundDownTo: 0.000001) asString) , ' 0 0 ' , ((self scaleFactor roundDownTo: 0.000001) asString) , ' 0 ' , (aPage format size y asString) , ' cm'."

	"Set line width to n point"
	"self out: ((1 / self scaleFactor) roundDownTo: 0.001) asString , ' w'."

	"Set line cap style to square"
	self out: '2 J'.
	
	"Set a default font"
	"self out: (PDFFontStyle new font: (self currentFont); render: self) "
	


	
]

{ #category : #accessing }
PDFDocument >> buffer [
	^ buffer ifNil: [ buffer := WriteStream on: String new ]
]

{ #category : #accessing }
PDFDocument >> buffer: bodyOfPDFDocument [
	buffer := bodyOfPDFDocument
]

{ #category : #private }
PDFDocument >> clearBuffer [
	"Initialize the buffer to produce a new document"

	self buffer resetContents; nextPutAll: ('%PDF-1.3' , String crlf).

	self fonts removeAll.
	self numberOfObjects: 1.
	self offset: 0.
	self offsets removeAll.
	self images removeAll.
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

{ #category : #configuration }
PDFDocument >> defaultFormat [
	^PDFA4Format new
]

{ #category : #private }
PDFDocument >> endDoc [
	"End of the PDF document"
	
	|  nObjects |
	
	nObjects := self numberOfObjects.
	"self addTheOrientations: nObjects."
	self addTheListOfFonts.
	self addTheImages.
	self addThepagesRoot: nObjects.


]

{ #category : #private }
PDFDocument >> endPage: aPageSize [

	"End of the page contents"
	self out: { 'endstream' . 'endobj' }.
	"Size of page contents stream"
	self newObj.
	self out: { (aPageSize asString) . 'endobj' }.

]

{ #category : #tools }
PDFDocument >> escape: aString [
	"answer a clean string at PDF format"
	
	| str |
	str := aString copyWithRegex: '\\' matchesReplacedWith: '\\\'.	
	str := str copyWithRegex: '\(' matchesReplacedWith: '\('.
	str := str copyWithRegex: '\)' matchesReplacedWith: '\)'.

	^str
]

{ #category : #action }
PDFDocument >> exportToFile: aFileName [
	"Export the PDF document in a file"
	
	| stream |
	stream := StandardFileStream fileNamed: aFileName.
	stream nextPutAll: self generate.
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
	" answer the PDF data"

	"new document: reset all"
	self clearBuffer.
		
	self pages do: [ :page |
		
		"Start of the page"
		self beginPage: page.
		
		"construct each styles in the document context"		
		self out: (page renderContent).

		"End of the page contents"
		self endPage:  (self buffer size) - (self offset).
	].
	"insert the end of the document"
	self endDoc.

	"Transcript  clear; show: self buffer."
	^self buffer contents 
	
]

{ #category : #accessing }
PDFDocument >> height [
	^(self format size y)
]

{ #category : #accessing }
PDFDocument >> images [
	"array of images"
	^ images ifNil: [ images := Dictionary new ]
]

{ #category : #'initialize-release' }
PDFDocument >> initialize [
	super initialize.

	self setFormat: self defaultFormat.
	self styleSheet: (PDFStyleSheet defaultForDocument: self).

	"self setAutoPageBreak: true margin: self margin."

]

{ #category : #private }
PDFDocument >> insertCatalog [
	"insert the catalog"

	self newObj.
	self out: { '<<' . '/Type /Catalog' . '/Pages 1 0 R' . '>>' . 'endobj' }.

]

{ #category : #private }
PDFDocument >> insertCrossRef [
	"Insert the cross references in the PDF document"
	
	self out: { 'xref' . ('0 ' , (self numberOfObjects + 1) asString) . '0000000000 65535 f ' }.
	1 to: (self numberOfObjects) do: [ :i | self out: ((self formatRef: (self offsets at: i)) , ' 00000 n') ]


]

{ #category : #private }
PDFDocument >> insertInformations [
	"Insert informations in the PDF document"
	
	self newObj.
	self out: {'<<' .
		('/Producer ' , (self textString: (self producer , ' ' , self version))) .
		('/Title ' , (self textString: self title)) .
		('/Subject ' , (self textString: self subject)) .	
		('/Author ' , (self textString: self author)) .
		('/Keywords ' , (self textString: self keywords)) .
		('/Creator ' , (self textString: self creator)) .
		('/CreationDate (D:' , self dateAndTimeInPDFFormat , ')') .
		'>>'}.
	self out: 'endobj'.
	
	

]

{ #category : #private }
PDFDocument >> insertTrailer: aBufferSize [
	"Insert the trailer in the PDF document"

	self out: { 'trailer' .
		('<< /Size ' , (self numberOfObjects + 1) asString) .
		('/Root ' , (self numberOfObjects asString) , ' 0 R') .
		('/Info ' , (self numberOfObjects - 1) asString , ' 0 R >>') .
		'startxref' .
		(aBufferSize asString) }.
	self buffer nextPutAll: '%%EOF'.


]

{ #category : #accessing }
PDFDocument >> keywords [
	^ keywords ifNil: [ keywords := '' ]
	
]

{ #category : #accessing }
PDFDocument >> keywords: aString [
	keywords := aString
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
	
	(aItem className = 'OrderedCollection' or: [ aItem className = 'Array' ] ) 
		ifTrue: [ aItem do: [ :aValue | self buffer nextPutAll: (aValue, String crlf) ] ]
		ifFalse: [ self buffer nextPutAll: (aItem, String crlf) ]
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

{ #category : #private }
PDFDocument >> pointsToUserUnit: aValue [
	"answer the value in the user unit"
	^(aValue / self scaleFactor)
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
PDFDocument >> setCurrentFont: aFontObject [
	"Set the current font used in the document"
	
	self currentFont: aFontObject.




]

{ #category : #'page setup' }
PDFDocument >> setFormat: aFormat [
	self format: aFormat.
]

{ #category : #accessing }
PDFDocument >> styleSheet [
	^ styleSheet
]

{ #category : #accessing }
PDFDocument >> styleSheet: anObject [
	styleSheet := anObject
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
	"Answer a formated text string"
	
	^('(' , (self escape: (aString asString)) , ')')
]

{ #category : #accessing }
PDFDocument >> title [
	^ title ifNil: [ title := '' ]
	
]

{ #category : #accessing }
PDFDocument >> title: aString [
	title := aString
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
	^(self format size x)
]
