"
A PDFDataAssociativeArray is the representation for associative arrays in PDF.

Instance Variables
	associativeArray:		<Object>

associativeArray
	- xxxxx

"
Class {
	#name : #PDFDataAssociativeArray,
	#superclass : #PDFDataType,
	#instVars : [
		'associativeArray'
	],
	#category : #'Artefact-DataType'
}

{ #category : #'as yet unclassified' }
PDFDataAssociativeArray >> acceptVisitor: aVisitor [
	^ aVisitor visitPDFDataAssociativeArray: self
]

{ #category : #accessing }
PDFDataAssociativeArray >> add: aPDFDataCouple [
	associativeArray add: aPDFDataCouple
]

{ #category : #accessing }
PDFDataAssociativeArray >> associativeArray [
	^ associativeArray
]

{ #category : #accessing }
PDFDataAssociativeArray >> associativeArray: anObject [
	associativeArray := anObject
]

{ #category : #'initialize-release' }
PDFDataAssociativeArray >> initialize [ 
	associativeArray := OrderedCollection new
]

{ #category : #'as yet unclassified' }
PDFDataAssociativeArray >> isPrintable [
	^ self associativeArray allSatisfy: [ :anElement | anElement isPrintable ]
]

{ #category : #printing }
PDFDataAssociativeArray >> printOn: aStream [
	aStream nextPutAll: '<<'; crlf.
	associativeArray do: 
		[:aCouple | 
			aCouple printOn: aStream. 
			aStream crlf ].
	aStream nextPutAll: '>>'
]

{ #category : #printing }
PDFDataAssociativeArray >> printWith: aPDFPrinter [
	aPDFPrinter printPDFDataAssociativeArray: self
]
