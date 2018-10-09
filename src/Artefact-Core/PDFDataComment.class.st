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

{ #category : #'as yet unclassified' }
PDFDataComment class >> text: aTextComment [
	^ self new comment: aTextComment
]

{ #category : #visit }
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

{ #category : #printing }
PDFDataComment >> isPrintable [
	^ true
]

{ #category : #printing }
PDFDataComment >> printOn: aStream [
	aStream nextPut: $%; nextPutAll: comment asString
]
