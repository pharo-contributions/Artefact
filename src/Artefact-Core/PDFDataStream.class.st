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
	#category : #'Artefact-Core-DataTypes'
}

{ #category : #'as yet unclassified' }
PDFDataStream class >> codeSegment: aCodeSegment [
	^ self new
		codeSegment: aCodeSegment;
		yourself
]

{ #category : #visit }
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

{ #category : #printing }
PDFDataStream >> printWith: aPDFPrinter [
	aPDFPrinter printPDFDataStream: self
]
