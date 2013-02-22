Class {
	#name : #PDFDataReference,
	#superclass : #PDFDataType,
	#instVars : [
		'referencedObject'
	],
	#category : #'Artefact-DataType'
}

{ #category : #'as yet unclassified' }
PDFDataReference class >> reference: aPDFDataObject [
	^ self new referencedObject: aPDFDataObject; yourself
]

{ #category : #'as yet unclassified' }
PDFDataReference >> acceptVisitor: aVisitor [
	^ aVisitor visitPDFDataReference: self
]

{ #category : #'as yet unclassified' }
PDFDataReference >> isPrintable [
	^ true
]

{ #category : #accessing }
PDFDataReference >> printOn: aStream [
	aStream nextPutAll: referencedObject id asString; space; nextPutAll: referencedObject revision asString; space; nextPut: $R
]

{ #category : #accessing }
PDFDataReference >> referencedObject [
	^ referencedObject
]

{ #category : #accessing }
PDFDataReference >> referencedObject: anObject [
	referencedObject := anObject
]
