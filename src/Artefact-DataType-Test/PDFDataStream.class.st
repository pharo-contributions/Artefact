Class {
	#name : #PDFDataStream,
	#superclass : #PDFDataType,
	#instVars : [
		'codeSegments'
	],
	#category : #'Artefact-DataType'
}

{ #category : #'as yet unclassified' }
PDFDataStream class >> codeSegments: aCollectionOfCodeSegments [
	^ self new
		codeSegments: aCollectionOfCodeSegments;
		yourself
]

{ #category : #'as yet unclassified' }
PDFDataStream >> acceptVisitor: aVisitor [
	^ aVisitor visitPDFDataStream: self
]

{ #category : #accessing }
PDFDataStream >> codeSegments [
	^ codeSegments
]

{ #category : #accessing }
PDFDataStream >> codeSegments: anObject [
	codeSegments := anObject
]

{ #category : #'as yet unclassified' }
PDFDataStream >> printWith: aPDFPrinter [
	aPDFPrinter printPDFDataStream: self
]
