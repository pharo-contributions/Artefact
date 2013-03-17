"
A PDFDataStream is the representation for stream in PDF.

It contains all codeSegments of a page which are the result of the PDFElements generation by PDFGenerator

Instance Variables
	codeSegment:		<Object>

codeSegment
	- xxxxx

"
Class {
	#name : #PDFDataStream,
	#superclass : #PDFDataType,
	#instVars : [
		'codeSegment'
	],
	#category : #'Artefact-DataType'
}

{ #category : #'as yet unclassified' }
PDFDataStream class >> codeSegment: aCodeSegment [
	^ self new
		codeSegment: aCodeSegment;
		yourself
]

{ #category : #'as yet unclassified' }
PDFDataStream >> acceptVisitor: aVisitor [
	^ aVisitor visitPDFDataStream: self
]

{ #category : #accessing }
PDFDataStream >> codeSegment [
	^ codeSegment
]

{ #category : #accessing }
PDFDataStream >> codeSegment: anObject [
	codeSegment := anObject
]

{ #category : #'as yet unclassified' }
PDFDataStream >> printWith: aPDFPrinter [
	aPDFPrinter printPDFDataStream: self
]
