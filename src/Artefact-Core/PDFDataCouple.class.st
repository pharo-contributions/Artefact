"
A PDFDataCouple is the representation for couples in PDF.

Instance Variables
	key:		<Object>
	value:		<Object>

key
	- xxxxx

value
	- xxxxx

"
Class {
	#name : #PDFDataCouple,
	#superclass : #PDFDataType,
	#instVars : [
		'key',
		'value'
	],
	#category : #'Artefact-Core-DataTypes'
}

{ #category : #'as yet unclassified' }
PDFDataCouple class >> key: aKey value: aValue [
	^ self new key: aKey; value: aValue; yourself
]

{ #category : #visit }
PDFDataCouple >> acceptVisitor: aVisitor [
	^ aVisitor visitPDFDataCouple: self
]

{ #category : #testing }
PDFDataCouple >> isPrintable [
	"Because it will never contain an unprintable dataType"
	^ key isPrintable and: [ value isPrintable ]
]

{ #category : #accessing }
PDFDataCouple >> key [
	^ key
]

{ #category : #accessing }
PDFDataCouple >> key: anObject [
	key := anObject
]

{ #category : #printing }
PDFDataCouple >> printOn: aStream [
	key printOn: aStream. 
	aStream space. 
	value printOn: aStream.
]

{ #category : #accessing }
PDFDataCouple >> printWith: aPDFPrinter [
	aPDFPrinter printPDFDataCouple: self
]

{ #category : #accessing }
PDFDataCouple >> value [
	^ value
]

{ #category : #accessing }
PDFDataCouple >> value: anObject [
	value := anObject
]
