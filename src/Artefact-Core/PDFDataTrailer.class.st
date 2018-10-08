"
A PDFDataTrailer is the representation for the trailer in PDF.

Instance Variables
	contents:		<Object>

contents
	- xxxxx

"
Class {
	#name : #PDFDataTrailer,
	#superclass : #PDFDataType,
	#instVars : [
		'contents'
	],
	#category : #'Artefact-Core-DataTypes'
}

{ #category : #visit }
PDFDataTrailer >> acceptVisitor: aVisitor [
	^ aVisitor visitPDFDataTrailer: self
]

{ #category : #accessing }
PDFDataTrailer >> addContent: aContent [
	contents addLast: aContent
]

{ #category : #accessing }
PDFDataTrailer >> contents [
	^ contents
]

{ #category : #accessing }
PDFDataTrailer >> contents: anObject [
	contents := anObject
]

{ #category : #'initialize-release' }
PDFDataTrailer >> initialize [ 
	contents := OrderedCollection new
]

{ #category : #printing }
PDFDataTrailer >> printOn: aStream [
	aStream nextPutAll: 'trailer'; lf.
	contents do: [:aContent | aContent printOn: aStream. aStream lf].
]
