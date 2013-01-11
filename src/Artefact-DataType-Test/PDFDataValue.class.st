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

{ #category : #printing }
PDFDataValue >> printOn: aStream [
	aStream nextPutAll: value asString
]

{ #category : #accessing }
PDFDataValue >> value: anObject [
	value := anObject
]
