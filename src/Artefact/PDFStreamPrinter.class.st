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
		'size'
	],
	#category : #'Artefact-Generator'
}

{ #category : #conversion }
PDFStreamPrinter >> convertToPoints: aUnitValue [ 
	^ (aUnitValue convertTo: #points) value
	
]

{ #category : #util }
PDFStreamPrinter >> generateStyleCodeForElement: anElementCodeSegment [
	| dotted thickness styleSheet |
	styleSheet := anElementCodeSegment styleSheet.
	^ String
		streamContents: [ :code | 
			thickness := styleSheet get: #thickness.
			code nextPutAll: (self convertToPoints: thickness) asString , ' ' , PDFByteCode thickness , String crlf.	"Set line cap style to square"
			code
				nextPutAll: '2 ' , PDFByteCode lineCapStyle;
				nextPutAll: String crlf.	"Set the colors or grey levels"
			code
				nextPutAll: (self initColors: styleSheet useDrawColor: anElementCodeSegment isDrawElement);
				nextPutAll: String crlf.	"Set the dotted propertie"
			dotted := styleSheet get: #dotted.
			dotted
				ifNil: [ 
					code
						nextPutAll: '[] 0 ' , PDFByteCode dotted;
						nextPutAll: String crlf ]
				ifNotNil: [ 
					code
						nextPutAll: (dotted generateCodeWith: self);
						nextPutAll: String crlf ].	"Insert the font size in the PDF document"
			code
				nextPutAll: 'BT /' , anElementCodeSegment fontId , ' ' , styleSheet font fontSizeAsPoints asString , ' Tf ET';
				nextPutAll: String crlf ]
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
		code nextPutAll: String crlf.
		(drawColor greyLevel isNil) 
				ifTrue: [ (drawColor red isNil) ifFalse: [ code nextPutAll: ((PDFColor formatRGB: drawColor) , ' ' , PDFByteCode drawWithColor) ] ]
				ifFalse: [ code nextPutAll: (PDFColor round: (drawColor greyLevel)) , ' ' , PDFByteCode drawWithGreyLevel ].
		code nextPutAll: String crlf.		
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
	stream nextPutAll: (self generateStyleCodeForElement: anElementCodeSegment).
	stream nextPutAll: anElementCodeSegment code; crlf
]

{ #category : #print }
PDFStreamPrinter >> printModel: aPDFCompleteModel on: aStream [
	stream := aStream.
	stream nextPutAll: '%PDF-1.3'; crlf.
	aPDFCompleteModel acceptVisitor: self.
	stream nextPutAll: '%%EOF'; crlf.
	
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
			stream crlf ].
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
	stream
		nextPutAll: 'startxref';
		crlf;
		nextPutAll: (self positions at: aPDFDataStartXref xref) asString;
		crlf
]

{ #category : #print }
PDFStreamPrinter >> printPDFDataStream: aPDFDataStream [
	| endPosition startPosition |
	stream nextPutAll: 'stream'; crlf.
	startPosition := stream position.
	aPDFDataStream codeSegment printWith: self.
	endPosition := stream position.
	self size at: aPDFDataStream put: endPosition - startPosition.
	stream nextPutAll: 'endstream'.
]

{ #category : #print }
PDFStreamPrinter >> printPDFDataStreamRefSize: aPDFDataStreamRefSize [
	stream
		nextPutAll: (self size at: aPDFDataStreamRefSize pdfDataStream) asString
]

{ #category : #visit }
PDFStreamPrinter >> printPDFDataXObjectStream: aPDFDataXObjectStream [
	| endPosition startPosition |
	stream nextPutAll: 'stream'; crlf.
	startPosition := stream position.
	stream nextPutAll: (aPDFDataXObjectStream stream reset contents).
	endPosition := stream position.
	stream crlf.
	self size at: aPDFDataXObjectStream put: endPosition - startPosition.
	stream nextPutAll: 'endstream'.
]

{ #category : #accessing }
PDFStreamPrinter >> size [
	^ size
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
	stream
		nextPutAll: aPDFDataObject id asString;
		space;
		nextPutAll: aPDFDataObject revision asString;
		space;
		nextPutAll: 'obj';
		crlf.
	aPDFDataObject contents
		do: [ :aContent | 
			aContent isPrintable
				ifTrue: [ aContent printOn: stream ]
				ifFalse: [ aContent printWith: self ].
			stream crlf ].
	stream
		nextPutAll: 'endobj';
		crlf.
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
	stream
		nextPutAll: 'trailer';
		crlf.
	aPDFDataTrailer contents
		do: [ :aContent | 
			aContent isPrintable
				ifTrue: [ aContent printOn: stream ]
				ifFalse: [ aContent printWith: self ].
			stream crlf ]
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
	stream
		nextPutAll: 'xref';
		crlf.
	stream
		nextPutAll: '0 ';
		nextPutAll: aPDFDataXRef referencies size asString;
		crlf.
	aPDFDataXRef referencies do: [ :aReferency | aReferency acceptVisitor: self ]
]

{ #category : #visit }
PDFStreamPrinter >> visitPDFDataXRefEntry: aPDFDataXRefEntry [
	| positionString |
	aPDFDataXRefEntry referencedObject
		ifNil: [ 
			stream
				nextPutAll: '0000000000 65535 f ';
				crlf ]
		ifNotNilDo: [ :aPDFDataObject | 
			positionString := (self positions at: aPDFDataObject) asString.
			1 to: 10 - positionString size do: [ :i | stream nextPut: $0 ].
			stream
				nextPutAll: positionString;
				nextPutAll: ' 00000 n';
				crlf ]
]
