"
A PDFDataXObjectStream is a pdf stream which contain multimedia resource.

Instance Variables
	stream:		<Object>

stream
	- xxxxx

"
Class {
	#name : #PDFDataXObjectStream,
	#superclass : #PDFDataType,
	#instVars : [
		'stream'
	],
	#category : #'Artefact-Core-DataTypes'
}

{ #category : #'as yet unclassified' }
PDFDataXObjectStream class >> stream: aStream [
	^ self new
		stream: aStream;
		yourself
]

{ #category : #visit }
PDFDataXObjectStream >> acceptVisitor: aVisitor [
	^ aVisitor visitPDFDataXObjectStream: self
]

{ #category : #printing }
PDFDataXObjectStream >> printWith: aPDFPrinter [
	aPDFPrinter printPDFDataXObjectStream: self
]

{ #category : #accessing }
PDFDataXObjectStream >> stream [
	^ stream
]

{ #category : #accessing }
PDFDataXObjectStream >> stream: anObject [
	stream := anObject
]
