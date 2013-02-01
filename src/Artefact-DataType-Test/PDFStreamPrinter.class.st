"
A PDFStreamPrinter takes many PDFDataType and produce a correct PDF file.

Instance Variables

"
Class {
	#name : #PDFStreamPrinter,
	#superclass : #Object,
	#category : #'Artefact-Generator'
}

{ #category : #'as yet unclassified' }
PDFStreamPrinter >> addLine: aString on: aStream [ 
	aStream nextPutAll: aString; nextPutAll: String crlf
]

{ #category : #'as yet unclassified' }
PDFStreamPrinter >> escape: aString [
	"answer a clean string at PDF format"
	
	| str |
	str := aString copyWithRegex: '\\' matchesReplacedWith: '\\\'.	
	str := str copyWithRegex: '\(' matchesReplacedWith: '\('.
	str := str copyWithRegex: '\)' matchesReplacedWith: '\)'.

	^str
]

{ #category : #render }
PDFStreamPrinter >> formatString: aString [
	"Answer a formated text string"
	
	^('(' , (self escape: (aString asString)) , ')')
]

{ #category : #'as yet unclassified' }
PDFStreamPrinter >> generateDocument: aPDFDocument on: aStream [
	self generate: (PDFVersion new) on: aStream.
	aPDFDocument pages do: [:aPage | self generate: aPage on: aStream].
	self insertFontsOn: aStream.
	self insertDocumentRootOn: aStream.
	self generate: (aPDFDocument metadata) on: aStream.
	self insertCatalogOn: aStream.
	self insertXRefOn: aStream.
	self insertTrailerOn: aStream.
	self generate: (PDFEOF new) on: aStream.
]

{ #category : #'as yet unclassified' }
PDFStreamPrinter >> generatePDFElement: aPDFElement on: aStream [
	self addLine: (aPDFElement generateCodeSegmentWithParent: nil) code on: aStream
]
