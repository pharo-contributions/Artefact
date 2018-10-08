"
A PDFDataXRefEntry is the representation an xref entry which point to an object in PDF.

Instance Variables
	referencedObject:		<Object>

referencedObject
	- xxxxx

"
Class {
	#name : #PDFDataXRefEntry,
	#superclass : #PDFDataType,
	#instVars : [
		'referencedObject'
	],
	#category : #'Artefact-Core-DataTypes'
}

{ #category : #'as yet unclassified' }
PDFDataXRefEntry class >> referencedObject: aPDFDataTypeObject [
	^ self new
		referencedObject: aPDFDataTypeObject;
		yourself
]

{ #category : #visit }
PDFDataXRefEntry >> acceptVisitor: aVisitor [
	^ aVisitor visitPDFDataXRefEntry: self
]

{ #category : #accessing }
PDFDataXRefEntry >> referencedObject [
	^ referencedObject
]

{ #category : #accessing }
PDFDataXRefEntry >> referencedObject: anObject [
	referencedObject := anObject
]
