"
A PDFStreamPrinter takes many PDFDataType and produce a correct PDF file.

Instance Variables

"
Class {
	#name : #PDFStreamPrinter,
	#superclass : #Object,
	#instVars : [
		'stream',
		'positions',
		'size',
		'streamContent',
		'compression',
		'characterStream'
	],
	#category : #'Artefact-Core-Generator'
}

{ #category : #compression }
PDFStreamPrinter >> compressWithGZip: aString [
	"format GZip data for use with PDF"
	|  data tA tB |
	
	data := self getGZipData: aString.
	
	tA := 1.
	tB := 0.

	aString do: [  :byte |
		tA := tA + (byte asInteger).
		(tA > 65521) ifTrue: [ tA := tA - 65521  ].
		tB := tB + tA.
		(tB > 65521) ifTrue: [ tB := tB - 65521  ].
	].
	
	data at: 1 put: (120 asCharacter).
	data at: 2 put: (156 asCharacter).

	data := data copyReplaceFrom: 3 to: 10 with: ''.
	
	data at: ((data size) - 7) put: (((tB bitAnd: 65280) / 256) asCharacter).
	data at: ((data size) - 6) put: ((tB bitAnd: 255) asCharacter).
	data at: ((data size) - 5) put: (((tA bitAnd: 65280) / 256) asCharacter).
	data at: ((data size) - 4) put: ((tA bitAnd: 255) asCharacter).
		
	^data copyReplaceFrom: (data size - 3) to: (data size) with: ''.
]

{ #category : #accessing }
PDFStreamPrinter >> compression [
	^compression
]

{ #category : #accessing }
PDFStreamPrinter >> compression: aBoolean [
	compression := aBoolean
]

{ #category : #conversion }
PDFStreamPrinter >> convertToPoints: aUnitValue [ 
	^ (aUnitValue convertTo: #points) value
	
]

{ #category : #util }
PDFStreamPrinter >> generateRotationCodeFor: anElementCodeSegment styleSheet: styleSheet [
	"insert rotation configuration"

	| angle cx cy |

	angle := (styleSheet get: #rotation) * (Float pi / 180).
	
	cx := (self convertToPoints: anElementCodeSegment fromElement from x) round: 4.
	cy := (self convertToPoints: anElementCodeSegment format height - (self convertToPoints: anElementCodeSegment fromElement from y)) round: 4.


	^ String
		streamContents: [ :code | 
			code
				nextPutAll: 'q';
				space;
				nextPutAll: (angle cos round: 4) asString;
				space;
				nextPutAll: (angle sin round: 4) asString;
				space;
				nextPutAll: (angle sin round: 4) negated asString;
				space;
				nextPutAll: (angle cos round: 4) asString;
				space;
				nextPutAll: cx asString;
				space;
				"il faut récupérer la hauteur de la page pour calculer la pos y ci dessous (h - y)"
				nextPutAll: cy asString;
				space;
				nextPutAll: 'cm 1 0 0 1';
				space;
				nextPutAll: (cx negated) asString;
				space;
				nextPutAll: (cy  negated) asString;
				space;
				nextPutAll: 'cm';
				nextPutAll: String lf ]
]

{ #category : #util }
PDFStreamPrinter >> generateStyleCodeForElement: anElementCodeSegment [
	| dotted thickness styleSheet |
	styleSheet := anElementCodeSegment styleSheet.
	^ String
		streamContents: [ :code | 
			((styleSheet get: #rotation) ~= 0) ifTrue: [ 
				code nextPutAll: (self generateRotationCodeFor: anElementCodeSegment styleSheet: styleSheet)
			].
			thickness := styleSheet get: #thickness.
			code nextPutAll: (self convertToPoints: thickness) asString , ' ' , PDFByteCode thickness , String lf.	
			"Set line cap style to square"
			code nextPutAll: (self setLineCapStyleFor: anElementCodeSegment stylesheet: styleSheet).
			"Set the colors or grey levels"
			code
				nextPutAll: (self initColors: styleSheet useDrawColor: anElementCodeSegment isDrawElement);
				nextPutAll: String lf.	"Set the dotted propertie"
			dotted := styleSheet get: #dotted.
			dotted
				ifNil: [ 
					code
						nextPutAll: '[] 0 ' , PDFByteCode dotted;
						nextPutAll: String lf ]
				ifNotNil: [ 
					code
						nextPutAll: (dotted generateCodeWith: self);
						nextPutAll: String lf ].	"Insert the font size in the PDF document"
			code
				nextPutAll: 'BT /' , anElementCodeSegment fontId , ' ' , styleSheet font fontSizeAsPoints asString , ' Tf ET';
				nextPutAll: String lf.
			code nextPutAll: '/' , anElementCodeSegment opacityId , ' ' , PDFByteCode setOpacity , String lf.
		]
]

{ #category : #compression }
PDFStreamPrinter >> getGZipData: aString [ 
	| writer |
	writer := GZipWriteStream on: String new.
	writer nextPutAll: aString.
	writer close.
 	^writer encodedStream contents


]

{ #category : #util }
PDFStreamPrinter >> initColors: aStyleSheet useDrawColor: useDrawColor [
	| drawColor fillColor textColor |
	
	drawColor := aStyleSheet get: #drawColor.
	fillColor := aStyleSheet get: #fillColor.
	textColor := aStyleSheet get: #textColor.
	
	^ String streamContents: [ :code |
		useDrawColor ifTrue: [
			(fillColor greyLevel isNil)
			ifTrue: [ (fillColor red isNil) ifFalse: [ code nextPutAll: ((PDFColor formatRGB: fillColor) , ' ' , PDFByteCode fillWithColor) ] ]
			ifFalse: [ code nextPutAll: (PDFColor round: (fillColor greyLevel)) , ' ' , PDFByteCode fillWithGreyLevel ].
		]
		ifFalse: [
			(textColor greyLevel isNil)
				ifTrue: [ (textColor red isNil) ifFalse: [ code nextPutAll: ((PDFColor formatRGB: textColor) , ' rg') ] ]
				ifFalse: [ code nextPutAll: (PDFColor round: (textColor greyLevel)) , ' g' ].
		].
		code nextPutAll: String lf.
		(drawColor greyLevel isNil) 
				ifTrue: [ (drawColor red isNil) ifFalse: [ code nextPutAll: ((PDFColor formatRGB: drawColor) , ' ' , PDFByteCode drawWithColor) ] ]
				ifFalse: [ code nextPutAll: (PDFColor round: (drawColor greyLevel)) , ' ' , PDFByteCode drawWithGreyLevel ].
		code nextPutAll: String lf.		
	]
]

{ #category : #'initialize-release' }
PDFStreamPrinter >> initialize [ 
	positions := Dictionary new.
	size := Dictionary new.
]

{ #category : #accessing }
PDFStreamPrinter >> positions [
	^ positions
]

{ #category : #print }
PDFStreamPrinter >> printCompositeCodeSegment: aCompositeCodeSegment [
	aCompositeCodeSegment segments do: [ :aSegment | aSegment printWith: self ]
]

{ #category : #print }
PDFStreamPrinter >> printElementCodeSegment: anElementCodeSegment [

	self streamContent nextPutAll: (self generateStyleCodeForElement: anElementCodeSegment).
	self streamContent nextPutAll: anElementCodeSegment code.
	self resetRotation: (anElementCodeSegment styleSheet get: #rotation) into: self streamContent.
	self streamContent nextPut: Character lf.


]

{ #category : #print }
PDFStreamPrinter >> printModel: aPDFCompleteModel compression: mustBeCompressed on: aStream [ 
	self compression: mustBeCompressed.
	stream := aStream.

	characterStream := ZnCharacterWriteStream on: aStream.
	characterStream nextPutAll: '%PDF-1.4'; lf.
	aPDFCompleteModel acceptVisitor: self.
	characterStream nextPutAll: '%%EOF'; lf.
]

{ #category : #print }
PDFStreamPrinter >> printPDFDataAssociativeArray: aPDFDataAssociativeArray [
	stream
		nextPutAll: '<<';
		crlf.
	aPDFDataAssociativeArray associativeArray
		do: [ :aCouple | 
			aCouple isPrintable
				ifTrue: [ aCouple printOn: stream ]
				ifFalse: [ aCouple printWith: self ].
			stream lf ].
	stream nextPutAll: '>>'
]

{ #category : #print }
PDFStreamPrinter >> printPDFDataCouple: aPDFDataCouple [
	aPDFDataCouple key isPrintable
		ifTrue: [ aPDFDataCouple key printOn: stream ]
		ifFalse: [ aPDFDataCouple key printWith: self ].
	stream space.
	aPDFDataCouple value isPrintable
		ifTrue: [ aPDFDataCouple value printOn: stream ]
		ifFalse: [ aPDFDataCouple value printWith: self ]
]

{ #category : #print }
PDFStreamPrinter >> printPDFDataStartXref: aPDFDataStartXref [
	characterStream
		nextPutAll: 'startxref';
		lf;
		nextPutAll: (self positions at: aPDFDataStartXref xref) asString;
		lf
]

{ #category : #print }
PDFStreamPrinter >> printPDFDataStream: aPDFDataStream [
	| endPosition startPosition streamData |
	
	characterStream
		nextPutAll: 'stream';
		lf.
	startPosition := stream position.
	
	self streamContent: (WriteStream on:  String new).
	aPDFDataStream codeSegment printWith: self.
	streamData := self streamContent contents.
	(self compression) ifTrue: [ streamData := (self compressWithGZip: streamData) asByteArray  ].

	stream nextPutAll: streamData.
	characterStream lf.

	endPosition := stream position.
	self size at: aPDFDataStream put: endPosition - startPosition.
	characterStream nextPutAll: 'endstream'
]

{ #category : #print }
PDFStreamPrinter >> printPDFDataStreamRefSize: aPDFDataStreamRefSize [
	stream
		nextPutAll: (self size at: aPDFDataStreamRefSize pdfDataStream) asString
]

{ #category : #visit }
PDFStreamPrinter >> printPDFDataXObjectStream: aPDFDataXObjectStream [
	| endPosition startPosition |
	stream nextPutAll: 'stream'; lf.
	startPosition := stream position.
	stream nextPutAll: (aPDFDataXObjectStream stream reset contents).
	endPosition := stream position.
	stream lf.
	self size at: aPDFDataXObjectStream put: endPosition - startPosition.
	stream nextPutAll: 'endstream'.
]

{ #category : #util }
PDFStreamPrinter >> resetRotation: aRotation into: aStream [
	(aRotation = 0) ifFalse: [ 
		aStream
			nextPut: Character lf;
			nextPutAll: PDFByteCode restoreGraphicsState.
	]
]

{ #category : #util }
PDFStreamPrinter >> setLineCapStyleFor: anElementCodeSegment stylesheet: styleSheet [
	"insert line cap configuration"

	^ String
		streamContents: [ :code | 
			(styleSheet get: #roundCap)
				ifTrue: [ code nextPutAll: PDFByteCode  lineRoundCapStyle ]
				ifFalse: [  code nextPutAll: PDFByteCode  lineSquareCapStyle ].
			code nextPutAll: String lf.
		 ]


]

{ #category : #accessing }
PDFStreamPrinter >> size [
	^ size
]

{ #category : #accessing }
PDFStreamPrinter >> streamContent [
	^streamContent
]

{ #category : #accessing }
PDFStreamPrinter >> streamContent: aString [
	streamContent := aString
]

{ #category : #visit }
PDFStreamPrinter >> visitPDFDataArray: aPDFDataArray [
	aPDFDataArray elements do: [ :aType | aType acceptVisitor: self ]
]

{ #category : #visit }
PDFStreamPrinter >> visitPDFDataAssociativeArray: aPDFDataAssociativeArray [
	aPDFDataAssociativeArray associativeArray do: [ :aType | aType acceptVisitor: self ]
]

{ #category : #visit }
PDFStreamPrinter >> visitPDFDataComment: aPDFDataComment [
	
]

{ #category : #visit }
PDFStreamPrinter >> visitPDFDataCouple: aPDFDataCouple [
	aPDFDataCouple key acceptVisitor: self.
	aPDFDataCouple key symbol = 'Parent'
		ifFalse: [ aPDFDataCouple value acceptVisitor: self ]
]

{ #category : #visit }
PDFStreamPrinter >> visitPDFDataDateAndTime: aPDFDataDateAndTime [
	
]

{ #category : #visit }
PDFStreamPrinter >> visitPDFDataObject: aPDFDataObject [
	self positions at: aPDFDataObject put: stream position.
	characterStream
		nextPutAll: aPDFDataObject id asString;
		space;
		nextPutAll: aPDFDataObject revision asString;
		space;
		nextPutAll: 'obj';
		lf.
	aPDFDataObject contents
		do: [ :aContent | 
			aContent isPrintable
				ifTrue: [ aContent printOn: characterStream ]
				ifFalse: [ aContent printWith: self ].
			characterStream lf ].
	characterStream
		nextPutAll: 'endobj';
		lf.
	aPDFDataObject contents do: [ :aContent | aContent acceptVisitor: self ]
]

{ #category : #visit }
PDFStreamPrinter >> visitPDFDataReference: aPDFDataReference [
	aPDFDataReference referencedObject acceptVisitor: self
]

{ #category : #visit }
PDFStreamPrinter >> visitPDFDataStartXref: aPDFDataStartXref [
	aPDFDataStartXref xref acceptVisitor: self
]

{ #category : #visit }
PDFStreamPrinter >> visitPDFDataStream: aPDFDataStream [

]

{ #category : #visit }
PDFStreamPrinter >> visitPDFDataStreamRefSize: aPDFDataStreamRefSize [
	
]

{ #category : #visit }
PDFStreamPrinter >> visitPDFDataString: aPDFDataString [
	
]

{ #category : #visit }
PDFStreamPrinter >> visitPDFDataSymbol: aPDFDataSymbol [
	
]

{ #category : #visit }
PDFStreamPrinter >> visitPDFDataTrailer: aPDFDataTrailer [
	aPDFDataTrailer contents do: [ :aContent | aContent acceptVisitor: self ].
	characterStream
		nextPutAll: 'trailer';
		lf.
	aPDFDataTrailer contents
		do: [ :aContent | 
			aContent isPrintable
				ifTrue: [ aContent printOn: characterStream ]
				ifFalse: [ aContent printWith: self ].
			characterStream lf ]
]

{ #category : #visit }
PDFStreamPrinter >> visitPDFDataValue: aPDFDataValue [
	
]

{ #category : #visit }
PDFStreamPrinter >> visitPDFDataXObjectStream: aPDFDataXObjectStream [
	
]

{ #category : #visit }
PDFStreamPrinter >> visitPDFDataXRef: aPDFDataXRef [
	self positions at: aPDFDataXRef put: stream position.
	characterStream
		nextPutAll: 'xref';
		lf.
	characterStream
		nextPutAll: '0 ';
		nextPutAll: aPDFDataXRef referencies size asString;
		lf.
	aPDFDataXRef referencies do: [ :aReferency | aReferency acceptVisitor: self ]
]

{ #category : #visit }
PDFStreamPrinter >> visitPDFDataXRefEntry: aPDFDataXRefEntry [
	| positionString |
	aPDFDataXRefEntry referencedObject
		ifNil: [ 
			characterStream
				nextPutAll: '0000000000 65535 f ';
				lf ]
		ifNotNil: [ :aPDFDataObject | 
			positionString := (self positions at: aPDFDataObject) asString.
			1 to: 10 - positionString size do: [ :i | characterStream nextPut: $0 ].
			characterStream
				nextPutAll: positionString;
				nextPutAll: ' 00000 n ';
				lf ]
]
