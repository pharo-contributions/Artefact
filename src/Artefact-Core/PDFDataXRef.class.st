"
A PDFDataXRef is the representation for the xref table in PDF.

Instance Variables
	referencies:		<Object>

referencies
	- xxxxx

"
Class {
	#name : #PDFDataXRef,
	#superclass : #PDFDataType,
	#instVars : [
		'referencies'
	],
	#category : #'Artefact-Core-DataTypes'
}

{ #category : #accessing }
PDFDataXRef >> AddReferenceTo: aPDFDataObject [
	referencies addLast: (PDFDataXRefEntry referencedObject: aPDFDataObject)
]

{ #category : #visit }
PDFDataXRef >> acceptVisitor: aVisitor [
	^ aVisitor visitPDFDataXRef: self
]

{ #category : #'initialize-release' }
PDFDataXRef >> initialize [
	referencies := OrderedCollection new.
	referencies add: PDFDataXRefEntry new.
]

{ #category : #accessing }
PDFDataXRef >> referencies [
	^ referencies
]

{ #category : #accessing }
PDFDataXRef >> referencies: anObject [
	referencies := anObject
]
