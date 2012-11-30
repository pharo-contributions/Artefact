Class {
	#name : #PDFPageElementCodeSegment,
	#superclass : #PDFElementCodeSegment,
	#instVars : [
		'styleSheet',
		'isDrawElement'
	],
	#category : #Artefact
}

{ #category : #'initialize-release' }
PDFPageElementCodeSegment class >> code: aCode styleSheet: aStyleSheet isDrawElement: aBoolean [
	^ self new code: aCode; styleSheet: aStyleSheet; isDrawElement: aBoolean; yourself 
]

{ #category : #accessing }
PDFPageElementCodeSegment >> isDrawElement [
	^ isDrawElement
]

{ #category : #accessing }
PDFPageElementCodeSegment >> isDrawElement: anObject [
	isDrawElement := anObject
]

{ #category : #accessing }
PDFPageElementCodeSegment >> isSecure [
	^ self true
]

{ #category : #accessing }
PDFPageElementCodeSegment >> styleSheet [
	^ styleSheet
]

{ #category : #accessing }
PDFPageElementCodeSegment >> styleSheet: anObject [
	styleSheet := anObject
]
