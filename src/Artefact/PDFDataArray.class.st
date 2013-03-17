"
A PDFDataArray is the representation for arrays in PDF.

Instance Variables
	elements:		<Object>

elements
	- xxxxx

"
Class {
	#name : #PDFDataArray,
	#superclass : #PDFDataType,
	#instVars : [
		'elements'
	],
	#category : #'Artefact-DataType'
}

{ #category : #'as yet unclassified' }
PDFDataArray class >> from: aCollection [
	
	| dataArray |
	dataArray := self new.
	aCollection do: [:anElement | dataArray addElement: anElement ].
	^ dataArray
]

{ #category : #'as yet unclassified' }
PDFDataArray >> acceptVisitor: aVisitor [
	^ aVisitor visitPDFDataArray: self
]

{ #category : #'as yet unclassified' }
PDFDataArray >> addElement: anElement [
	elements addLast: anElement 
]

{ #category : #accessing }
PDFDataArray >> elements [
	^ elements
]

{ #category : #accessing }
PDFDataArray >> elements: anObject [
	elements := anObject
]

{ #category : #'initialize-release' }
PDFDataArray >> initialize [ 
	elements := OrderedCollection new
]

{ #category : #'as yet unclassified' }
PDFDataArray >> isPrintable [
	"Because it will never contain an unprintable dataType"
	^ true
]

{ #category : #printing }
PDFDataArray >> printOn: aStream [
	aStream nextPut: $[; space.
	elements do: [:anElement | anElement printOn: aStream. aStream space].
	aStream nextPut: $]
]
