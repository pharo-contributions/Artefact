"
A PDFDataValue is the representation for a value in PDF.

Instance Variables
	value:		<Object>

value
	- xxxxx

"
Class {
	#name : #PDFDataValue,
	#superclass : #PDFDataType,
	#instVars : [
		'value'
	],
	#category : #'Artefact-Core-DataTypes'
}

{ #category : #'instance creation' }
PDFDataValue class >> value: aValue [

	^ self new
		  value: aValue;
		  yourself
]

{ #category : #visiting }
PDFDataValue >> acceptVisitor: aVisitor [

	^ aVisitor visitPDFDataValue: self
]

{ #category : #testing }
PDFDataValue >> isPrintable [

	^ true
]

{ #category : #printing }
PDFDataValue >> printOn: aStream [

	aStream nextPutAll: value asString
]

{ #category : #evaluating }
PDFDataValue >> value [

	^ value
]

{ #category : #accessing }
PDFDataValue >> value: anObject [

	value := anObject
]
