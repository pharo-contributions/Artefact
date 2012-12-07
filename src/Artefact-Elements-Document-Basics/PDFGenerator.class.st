Class {
	#name : #PDFGenerator,
	#superclass : #Object,
	#category : #'Artefact-Generator'
}

{ #category : #'as yet unclassified' }
PDFGenerator >> addLine: aString on: aStream [ 
	aStream nextPutAll: aString; nextPutAll: String crlf
]

{ #category : #'as yet unclassified' }
PDFGenerator >> generate: anArtefactElement on: aStream [
	anArtefactElement generateWith: self on: aStream.
]

{ #category : #'as yet unclassified' }
PDFGenerator >> generateDocument: aPDFDocument on: aStream [
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
PDFGenerator >> generatePDFElement: aPDFElement on: aStream [
	self addLine: (aPDFElement generateCodeSegmentWithParent: nil) code on: aStream
]
