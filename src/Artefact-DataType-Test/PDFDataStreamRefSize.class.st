Class {
	#name : #PDFDataStreamRefSize,
	#superclass : #PDFDataType,
	#instVars : [
		'pdfDataStream'
	],
	#category : #'Artefact-DataType'
}

{ #category : #'as yet unclassified' }
PDFDataStreamRefSize class >> stream: aStream [
	^ self new
		pdfDataStream: aStream;
		yourself
]

{ #category : #accessing }
PDFDataStreamRefSize >> pdfDataStream [
	^ pdfDataStream
]

{ #category : #accessing }
PDFDataStreamRefSize >> pdfDataStream: anObject [
	pdfDataStream := anObject
]
