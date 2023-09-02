"
A PDFDataReference is the representation for references to objects in PDF.

Instance Variables
	referencedObject:		<Object>

referencedObject
	- xxxxx

"
Class {
	#name : #PDFDataReference,
	#superclass : #PDFDataType,
	#instVars : [
		'referencedObject'
	],
	#category : #'Artefact-Core-DataTypes'
}

{ #category : #'instance creation' }
PDFDataReference class >> reference: aPDFDataObject [

	^ self new
		  referencedObject: aPDFDataObject;
		  yourself
]

{ #category : #visiting }
PDFDataReference >> acceptVisitor: aVisitor [

	^ aVisitor visitPDFDataReference: self
]

{ #category : #testing }
PDFDataReference >> isPrintable [

	^ true
]

{ #category : #printing }
PDFDataReference >> printOn: aStream [

	aStream
		nextPutAll: referencedObject id asString;
		space;
		nextPutAll: referencedObject revision asString;
		space;
		nextPut: $R
]

{ #category : #accessing }
PDFDataReference >> referencedObject [

	^ referencedObject
]

{ #category : #accessing }
PDFDataReference >> referencedObject: anObject [

	referencedObject := anObject
]
