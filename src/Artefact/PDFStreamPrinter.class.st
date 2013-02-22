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

{ #category : #'as yet unclassified' }
PDFStreamPrinter >> initialize [ 
	positions := Dictionary new.
	size := Dictionary new.
]

{ #category : #'as yet unclassified' }
PDFStreamPrinter >> positions [
	^ positions
]

{ #category : #'as yet unclassified' }
PDFStreamPrinter >> printModel: aPDFCompleteModel on: aStream [
	stream := aStream.
	stream nextPutAll: '%PDF-1.3'; crlf.
	aPDFCompleteModel acceptVisitor: self.
	stream nextPutAll: '%%EOF'; crlf.
	
]

{ #category : #'as yet unclassified' }
PDFStreamPrinter >> printPDFDataStartXref: aPDFDataStartXref [
	stream
		nextPutAll: 'startxref';
		crlf;
		nextPutAll: (self positions at: aPDFDataStartXref xref) asString;
		crlf
]

{ #category : #'as yet unclassified' }
PDFStreamPrinter >> printPDFDataStream: aPDFDataStream [

]

{ #category : #'as yet unclassified' }
PDFStreamPrinter >> printPDFDataStreamRefSize: aPDFDataStreamRefSize [
	stream
		nextPutAll: (self size at: aPDFDataStreamRefSize pdfDataStream) asString
]

{ #category : #'as yet unclassified' }
PDFStreamPrinter >> size [
	^ size
]

{ #category : #'as yet unclassified' }
PDFStreamPrinter >> visitPDFDataArray: aPDFDataArray [
	aPDFDataArray elements do: [ :aType | aType acceptVisitor: self ]
]

{ #category : #'as yet unclassified' }
PDFStreamPrinter >> visitPDFDataAssociativeArray: aPDFDataAssociativeArray [
	aPDFDataAssociativeArray associativeArray do: [ :aType | aType acceptVisitor: self ]
]

{ #category : #'as yet unclassified' }
PDFStreamPrinter >> visitPDFDataComment: aPDFDataComment [
	
]

{ #category : #'as yet unclassified' }
PDFStreamPrinter >> visitPDFDataCouple: aPDFDataCouple [
	aPDFDataCouple key acceptVisitor: self.
	aPDFDataCouple key symbol = 'Parent'
		ifFalse: [ aPDFDataCouple value acceptVisitor: self ]
]

{ #category : #'as yet unclassified' }
PDFStreamPrinter >> visitPDFDataDateAndTime: aPDFDataDateAndTime [
	
]

{ #category : #'as yet unclassified' }
PDFStreamPrinter >> visitPDFDataObject: aPDFDataObject [
	aPDFDataObject contents reverse do: [ :aContent | aContent acceptVisitor: self ].
	self positions at: aPDFDataObject put: stream position + 1.
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
		crlf
]

{ #category : #'as yet unclassified' }
PDFStreamPrinter >> visitPDFDataReference: aPDFDataReference [
	aPDFDataReference referencedObject acceptVisitor: self
]

{ #category : #'as yet unclassified' }
PDFStreamPrinter >> visitPDFDataStartXref: aPDFDataStartXref [
	aPDFDataStartXref xref acceptVisitor: self
]

{ #category : #'as yet unclassified' }
PDFStreamPrinter >> visitPDFDataStream: aPDFDataStream [
		| endPosition startPosition |
	startPosition := stream position.
	self flag: 'TO DO '.	" Write  "
	endPosition := stream position.
	self size at: aPDFDataStream put: endPosition - startPosition
]

{ #category : #'as yet unclassified' }
PDFStreamPrinter >> visitPDFDataStreamRefSize: aPDFDataStreamRefSize [
	
]

{ #category : #'as yet unclassified' }
PDFStreamPrinter >> visitPDFDataString: aPDFDataString [
	
]

{ #category : #'as yet unclassified' }
PDFStreamPrinter >> visitPDFDataSymbol: aPDFDataSymbol [
	
]

{ #category : #'as yet unclassified' }
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

{ #category : #'as yet unclassified' }
PDFStreamPrinter >> visitPDFDataValue: aPDFDataValue [
	
]

{ #category : #'as yet unclassified' }
PDFStreamPrinter >> visitPDFDataXRef: aPDFDataXRef [
	self positions at: aPDFDataXRef put: stream position + 1.
	stream
		nextPutAll: 'xref';
		crlf.
	stream
		nextPutAll: '0 ';
		nextPutAll: aPDFDataXRef referencies size asString;
		crlf.
	aPDFDataXRef referencies do: [ :aReferency | aReferency acceptVisitor: self ]
]

{ #category : #'as yet unclassified' }
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
