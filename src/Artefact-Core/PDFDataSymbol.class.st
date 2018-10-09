"
A PDFDataSymbol is the representation for a symbol in PDF.

Instance Variables
	symbol:		<Object>

symbol
	- xxxxx

"
Class {
	#name : #PDFDataSymbol,
	#superclass : #PDFDataType,
	#instVars : [
		'symbol'
	],
	#category : #'Artefact-Core-DataTypes'
}

{ #category : #'as yet unclassified' }
PDFDataSymbol class >> symbol: aSymbol [
	^ self new symbol: aSymbol; yourself
]

{ #category : #visit }
PDFDataSymbol >> acceptVisitor: aVisitor [
	^ aVisitor visitPDFDataSymbol: self
]

{ #category : #testing }
PDFDataSymbol >> isPrintable [
	^ true
]

{ #category : #accessing }
PDFDataSymbol >> printOn: aStream [
	aStream nextPut: $/; nextPutAll: symbol asString
]

{ #category : #accessing }
PDFDataSymbol >> symbol [
	^ symbol
]

{ #category : #accessing }
PDFDataSymbol >> symbol: anObject [
	symbol := anObject
]
