"
A PDFDataStreamRefSize is the representation for a stream size in PDF.

Instance Variables
	pdfDataStream:		<Object>

pdfDataStream
	- xxxxx

"
Class {
	#name : #PDFDataStreamRefSize,
	#superclass : #PDFDataType,
	#instVars : [
		'pdfDataStream'
	],
	#category : #'Artefact-Core-DataTypes'
}

{ #category : #'instance creation' }
PDFDataStreamRefSize class >> stream: aStream [

	^ self new
		  pdfDataStream: aStream;
		  yourself
]

{ #category : #visiting }
PDFDataStreamRefSize >> acceptVisitor: aVisitor [
	^ aVisitor visitPDFDataStreamRefSize: self
]

{ #category : #accessing }
PDFDataStreamRefSize >> pdfDataStream [

	^ pdfDataStream
]

{ #category : #accessing }
PDFDataStreamRefSize >> pdfDataStream: anObject [

	pdfDataStream := anObject
]

{ #category : #printing }
PDFDataStreamRefSize >> printWith: aPDFPrinter [

	aPDFPrinter printPDFDataStreamRefSize: self
]
