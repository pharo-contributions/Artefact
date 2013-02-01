Class {
	#name : #PDFElementCodeSegment,
	#superclass : #Object,
	#instVars : [
		'code'
	],
	#category : #Artefact
}

{ #category : #'as yet unclassified' }
PDFElementCodeSegment class >> code: aString styleSheet: aPDFStyleSheet [
	^ self new
		code: aString;
		styleSheet: aPDFStyleSheet;
		yourself
]

{ #category : #accessing }
PDFElementCodeSegment >> code [
	^ code
]

{ #category : #accessing }
PDFElementCodeSegment >> code: anObject [
	code := anObject
]

{ #category : #accessing }
PDFElementCodeSegment >> isDrawElement [
	^ isDrawElement
]

{ #category : #accessing }
PDFElementCodeSegment >> isDrawElement: anObject [
	isDrawElement := anObject
]

{ #category : #'as yet unclassified' }
PDFElementCodeSegment >> isPDFObject [
	^ false
]

{ #category : #accessing }
PDFElementCodeSegment >> isSecure [
	^ self true
]

{ #category : #accessing }
PDFElementCodeSegment >> styleSheet [
	^ styleSheet
]

{ #category : #accessing }
PDFElementCodeSegment >> styleSheet: anObject [
	styleSheet := anObject
]
