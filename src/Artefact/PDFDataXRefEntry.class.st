Class {
	#name : #PDFDataXRefEntry,
	#superclass : #PDFDataType,
	#instVars : [
		'referencedObject'
	],
	#category : #'Artefact-DataType'
}

{ #category : #'as yet unclassified' }
PDFDataXRefEntry class >> referencedObject: aPDFDataTypeObject [
	^ self new
		referencedObject: aPDFDataTypeObject;
		yourself
]

{ #category : #'as yet unclassified' }
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
