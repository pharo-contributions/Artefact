"
A PDFDataStartXref is the representation for the stream position of the xref table in PDF.

Instance Variables
	xref:		<Object>

xref
	- xxxxx

"
Class {
	#name : #PDFDataStartXref,
	#superclass : #PDFDataType,
	#instVars : [
		'xref'
	],
	#category : #'Artefact-DataType'
}

{ #category : #'as yet unclassified' }
PDFDataStartXref class >> to: aPDFDataXRef [
	^ self new
		xref: aPDFDataXRef;
		yourself
]

{ #category : #'as yet unclassified' }
PDFDataStartXref >> acceptVisitor: aVisitor [
	^ aVisitor visitPDFDataStartXref: self
]

{ #category : #'as yet unclassified' }
PDFDataStartXref >> printWith: aPDFPrinter [
	aPDFPrinter printPDFDataStartXref: self
]

{ #category : #accessing }
PDFDataStartXref >> xref [
	^ xref
]

{ #category : #accessing }
PDFDataStartXref >> xref: anObject [
	xref := anObject
]
