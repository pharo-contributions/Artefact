Class {
	#name : #PDFElementCodeSegment,
	#superclass : #PDFCodeSegment,
	#instVars : [
		'styleSheet',
		'isDrawElement',
		'code'
	],
	#category : #'Artefact-CodeSegment'
}

{ #category : #'initialize-release' }
PDFElementCodeSegment class >> code: aCode styleSheet: aStyleSheet isDrawElement: aBoolean [
	^ self new code: aCode; styleSheet: aStyleSheet; isDrawElement: aBoolean; yourself 
]

{ #category : #accessing }
PDFElementCodeSegment >> code [
	^ code
]

{ #category : #accessing }
PDFElementCodeSegment >> code: anObject [
	code := anObject
]
