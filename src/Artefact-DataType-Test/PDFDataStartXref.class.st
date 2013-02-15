Class {
	#name : #PDFDataStartXref,
	#superclass : #PDFDataType,
	#instVars : [
		'xref'
	],
	#category : #'Artefact-DataType'
}

{ #category : #'as yet unclassified' }
PDFDataStartXref class >> to: aPDFDataXRef [
	^ self new
		xref: aPDFDataXRef;
		yourself
]

{ #category : #accessing }
PDFDataStartXref >> xref [
	^ xref
]

{ #category : #accessing }
PDFDataStartXref >> xref: anObject [
	xref := anObject
]
