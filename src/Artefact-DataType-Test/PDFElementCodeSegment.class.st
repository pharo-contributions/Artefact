Class {
	#name : #PDFElementCodeSegment,
	#superclass : #Object,
	#instVars : [
		'code'
	],
	#category : #Artefact
}

{ #category : #accessing }
PDFElementCodeSegment >> code [
	^ code
]

{ #category : #accessing }
PDFElementCodeSegment >> code: anObject [
	code := anObject
]

{ #category : #'as yet unclassified' }
PDFElementCodeSegment >> isPDFObject [
	^ false
]
