Class {
	#name : #PDFDataCouple,
	#superclass : #PDFDataType,
	#instVars : [
		'key',
		'value'
	],
	#category : #'Artefact-DataType'
}

{ #category : #'as yet unclassified' }
PDFDataCouple class >> key: aKey value: aValue [
	^ self new key: aKey; value: aValue; yourself
]

{ #category : #'as yet unclassified' }
PDFDataCouple >> acceptVisitor: aVisitor [
	^ aVisitor visitPDFDataCouple: self
]

{ #category : #'as yet unclassified' }
PDFDataCouple >> isPrintable [
	"Because it will never contain an unprintable dataType"
	^ true
]

{ #category : #accessing }
PDFDataCouple >> key [
	^ key
]

{ #category : #accessing }
PDFDataCouple >> key: anObject [
	key := anObject
]

{ #category : #'as yet unclassified' }
PDFDataCouple >> printOn: aStream [
	key printOn: aStream. 
	aStream space. 
	value printOn: aStream..
]

{ #category : #accessing }
PDFDataCouple >> value [
	^ value
]

{ #category : #accessing }
PDFDataCouple >> value: anObject [
	value := anObject
]
