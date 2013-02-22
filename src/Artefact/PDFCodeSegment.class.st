Class {
	#name : #PDFCodeSegment,
	#superclass : #Object,
	#instVars : [
		'styleSheet',
		'isDrawElement'
	],
	#category : #'Artefact-CodeSegment'
}

{ #category : #'as yet unclassified' }
PDFCodeSegment class >> code: aString styleSheet: aPDFStyleSheet [
	^ self new
		code: aString;
		styleSheet: aPDFStyleSheet;
		yourself
]

{ #category : #accessing }
PDFCodeSegment >> isDrawElement [
	^ isDrawElement
]

{ #category : #accessing }
PDFCodeSegment >> isDrawElement: anObject [
	isDrawElement := anObject
]

{ #category : #accessing }
PDFCodeSegment >> isSecure [
	^ true
]

{ #category : #accessing }
PDFCodeSegment >> styleSheet [
	^ styleSheet
]

{ #category : #accessing }
PDFCodeSegment >> styleSheet: anObject [
	styleSheet := anObject
]
