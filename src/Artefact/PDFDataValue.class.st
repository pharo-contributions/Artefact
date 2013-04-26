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
	#category : #'Artefact-DataType'
}

{ #category : #'as yet unclassified' }
PDFDataValue class >> value: aValue [
	^ self new value: aValue; yourself
]

{ #category : #'as yet unclassified' }
PDFDataValue >> acceptVisitor: aVisitor [
	^ aVisitor visitPDFDataValue: self
]

{ #category : #'as yet unclassified' }
PDFDataValue >> isPrintable [
	^ true
]

{ #category : #printing }
PDFDataValue >> printOn: aStream [
	aStream nextPutAll: value asString
]

{ #category : #accessing }
PDFDataValue >> value [
	^ value
]

{ #category : #accessing }
PDFDataValue >> value: anObject [
	value := anObject
]
