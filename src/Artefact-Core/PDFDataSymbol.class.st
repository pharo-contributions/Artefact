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

{ #category : #'instance creation' }
PDFDataSymbol class >> symbol: aSymbol [

	^ self new
		  symbol: aSymbol;
		  yourself
]

{ #category : #visiting }
PDFDataSymbol >> acceptVisitor: aVisitor [

	^ aVisitor visitPDFDataSymbol: self
]

{ #category : #testing }
PDFDataSymbol >> isPrintable [

	^ true
]

{ #category : #printing }
PDFDataSymbol >> printOn: aStream [

	aStream
		nextPut: $/;
		nextPutAll: symbol asString
]

{ #category : #accessing }
PDFDataSymbol >> symbol [

	^ symbol
]

{ #category : #accessing }
PDFDataSymbol >> symbol: anObject [

	symbol := anObject
]
