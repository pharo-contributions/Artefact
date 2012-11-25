Class {
	#name : #PDFCodeSegment,
	#superclass : #Object,
	#instVars : [
		'styleSheet',
		'code',
		'isDrawElement'
	],
	#category : #Artefact
}

{ #category : #'initialize-release' }
PDFCodeSegment class >> code: aCode styleSheet: aStyleSheet isDrawElement: aBoolean [
	^ self new code: aCode; styleSheet: aStyleSheet; isDrawElement: aBoolean; yourself 
]

{ #category : #accessing }
PDFCodeSegment >> code [
	^ code
]

{ #category : #accessing }
PDFCodeSegment >> code: anObject [
	code := anObject
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
	^ self true
]

{ #category : #accessing }
PDFCodeSegment >> styleSheet [
	^ styleSheet
]

{ #category : #accessing }
PDFCodeSegment >> styleSheet: anObject [
	styleSheet := anObject
]
