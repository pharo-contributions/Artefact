"
a PDFDataComment is the representation for comments in PDF.
"
Class {
	#name : #PDFDataComment,
	#superclass : #PDFDataType,
	#instVars : [
		'comment'
	],
	#category : #'Artefact-Core-DataTypes'
}

{ #category : #'instance creation' }
PDFDataComment class >> text: aTextComment [

	^ self new comment: aTextComment
]

{ #category : #visiting }
PDFDataComment >> acceptVisitor: aVisitor [

	^ aVisitor visitPDFDataComment: self
]

{ #category : #accessing }
PDFDataComment >> comment [

	^ comment
]

{ #category : #accessing }
PDFDataComment >> comment: anObject [

	comment := anObject
]

{ #category : #testing }
PDFDataComment >> isPrintable [

	^ true
]

{ #category : #printing }
PDFDataComment >> printOn: aStream [

	aStream
		nextPut: $%;
		nextPutAll: comment asString
]
